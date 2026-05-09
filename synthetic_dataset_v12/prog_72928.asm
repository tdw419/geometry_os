; DESCRIPTION: Places a orange line segment connecting (147, 200) to (161, 192).
; PLAN: r0=147(x1), r1=200(y1), r2=161(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 200
LDI r2, 161
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
