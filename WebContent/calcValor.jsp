<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Preço Calculado</title>
</head>
<body>

<%
	//Quilometros rodados
	double pav = 0;
	double semPav = 0;
	
	//Chaves condicionais de segurança
	if(request.getParameter("kmPav") != ""){
		if(Double.parseDouble(request.getParameter("kmPav"))<0){
			out.println("A distância precisa ter um valor positivo ou igual a zero.<br>");
			return;
		} else{
			pav = Double.parseDouble(request.getParameter("kmPav"));
		}
	} else {
		pav = 0;
	}
	
	if(request.getParameter("kmSPav") != ""){
		if(Double.parseDouble(request.getParameter("kmSPav"))<0){
			out.println("A distância precisa ter um valor positivo ou igual a zero.<br>");
			return;
		} else{
			semPav = Double.parseDouble(request.getParameter("kmSPav"));
		}
	} else {
		semPav = 0;
	}
	
	//Calculo preço/dist/valor total
	double kmPav = pav*0.54;
	double kmSemPav = semPav*0.62;
	double kmTotal = pav + semPav;
	double valorTotal = kmPav + kmSemPav;
	
	//Veículos utilizado
	boolean camBau = request.getParameter("veiculo").equals("camBau");
	boolean camCac = request.getParameter("veiculo").equals("camCac");
	boolean carreta = request.getParameter("veiculo").equals("carreta");
	
	if(request.getParameter("veiculo") != null) {
	    if(camBau) {
	        valorTotal = valorTotal*1;
	    }
	    else if(camCac) {
	        valorTotal = valorTotal*1.05;
	    }
	    else if(carreta) {
	        valorTotal = valorTotal*1.12;
	    }
	}
	
	//Carga transportada
	if(request.getParameter("ton") != ""){
		double ton = Double.parseDouble(request.getParameter("ton"));
		if(ton > 5){
			ton = ton - 5;
			valorTotal = valorTotal + ton*0.02*kmTotal;
		}
	}
%>

Valor total: <%=valorTotal %> R$<br/>
Quilômetros rodados: <%=kmTotal %> km<br/>
</body>
</html>