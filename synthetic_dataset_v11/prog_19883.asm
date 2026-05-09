; DESCRIPTION: Places a orange line segment connecting (249, 198) to (110, 247).
; PLAN: r0=249(x1), r1=198(y1), r2=110(x2), r3=247(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 198
LDI r2, 110
LDI r3, 247
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
