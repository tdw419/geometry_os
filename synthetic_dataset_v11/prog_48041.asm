; DESCRIPTION: Draws a orange line from (147, 35) to (152, 229).
; PLAN: r0=147(x1), r1=35(y1), r2=152(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 35
LDI r2, 152
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
