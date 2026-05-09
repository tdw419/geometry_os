; DESCRIPTION: Places a orange line segment connecting (62, 145) to (147, 47).
; PLAN: r0=62(x1), r1=145(y1), r2=147(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 145
LDI r2, 147
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
