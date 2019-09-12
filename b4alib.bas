B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=9.5
@EndOfDesignText@
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'' @b4alib                                                                    '' 
''                                                                            ''
'' Módulo de rotinas de uso global para aplicações desenvolvidas com          ''
'' a ferramenta b4a (https://www.b4x.com)                                     ''
''                                                                            ''
'' Administrador:                                                             ''
'' Jeferson Rodrigo Stefani <jefersonrodrigostefani@gmail.com>                ''
''                                                                            ''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Sub Process_Globals
	
End Sub

Sub LoadFormatSettingsDefault
	DateTime.DateFormat = "dd/mm/yyyy"
	DateTime.TimeFormat = "hh:mm:ssss"
End Sub

Sub Dia As Int
	Return DateTime.GetDayOfMonth( DateTime.Now ) 
End Sub

Sub Mes As Int
	Return DateTime.GetMonth( DateTime.Now ) 
End Sub

Sub Ano As Int
	Return DateTime.GetYear( DateTime.Now ) 
End Sub

Sub Hoje As Long
	Return DateTime.Now
End Sub

Sub QualDiaDaSemana As String
	Dim S As String
	Select DateTime.GetDayOfWeek( DateTime.Now )
		Case 1
			S = "Domingo"
		Case 2
			S = "Segunda-feira"
		Case 3
			S = "Terça-feira"
		Case 4
			S = "Quarta-feira"
		Case 5
			S = "Quinta-feira"
		Case 6
			S = "Sexta-feira"
		Case 7
			S = "Sábado"
	End Select
	Return S
End Sub

Sub QualMesEstamos As String
	Dim S As String
	Select DateTime.GetMonth( DateTime.Now )
		Case 1 
			S = "Janeiro"
		Case 2
			S = "Fevereiro"
		Case 3
			S = "Março"
		Case 4
			S = "Abril"
		Case 5
			S = "Maio"
		Case 6
			S = "Junho"
		Case 7
			S = "Julho"
		Case 8
			S = "Agosto"
		Case 9
			S = "Setembro"
		Case 10
			S = "Outubro"
		Case 11
			S = "Novembro"
		Case 12
			S = "Dezembro"			
	End Select
	Return S
End Sub

Sub CasoAnoBissexto( D As Long ) As Boolean
	Dim Data As Long
	If D > 0 Then
		Data = D
	Else
		Data = Hoje	
	End If
	''
	If ( ( Data Mod 4 = 0 ) And ( Data Mod 100 <> 0 ) ) Or ( Data Mod 400 = 0 ) Then
		Return True
	Else
		Return False	
	End If
End Sub

Sub QtdeDiasNoMes( M As Int ) As Int
	Dim vMes As Int
	If M > 0 Then
		vMes = M
	Else
		vMes = Mes
	End If
	''
	Select vMes
		Case 1, 3, 5, 7, 8, 10, 12 
			Return 31
		Case 2 
			If CasoAnoBissexto( Hoje ) Then
				Return 29
			Else
			    Return 28
			End If	
		Case Else
			Return 30
	End Select
End Sub

Sub QualHH As Int
	Return DateTime.GetHour( DateTime.Now )
End Sub

Sub QualMM As Int
	Return DateTime.GetMinute( DateTime.Now )
End Sub

Sub QualSS As Int
	Return DateTime.GetSecond( DateTime.Now )
End Sub

Sub IIF( B As Boolean, V As String, F As String ) As String
	Dim S As String
	If B Then 
		S = V 
	Else 
		S = F 
	End If
	Return S
End Sub

Sub Replicar( Valor As String, Qtde As Int ) As String
	Dim I As Int
	Dim S As String = ""
	For i = 1 To Qtde
		S = S & Valor
	Next
	Return S
End Sub

Sub ZeroOnde( Origem As Int, Valor As String, Qtde As Int ) As String
	Dim S As String
	Select Origem
		Case 1 '' Esquerda
			S = Replicar( "0", Qtde - Valor.Length ) & Valor
		Case 2 '' Direita
			S = Valor & Replicar( "0", Qtde - Valor.Length )
	End Select
	Return S
End Sub	

Sub FormataValor( CasasDecimais As Int, Valor As Double) As String
	Return NumberFormat( Valor, 0, CasasDecimais )
End Sub

Sub NomeDoApk As String
	Return Application.LabelName	
End Sub

Sub VersaoDoApk As String
	Return Application.VersionCode
End Sub

