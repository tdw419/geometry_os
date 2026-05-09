; DESCRIPTION: Places a orange line segment connecting (244, 6) to (218, 147).
; PLAN: r0=244(x1), r1=6(y1), r2=218(x2), r3=147(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 6
LDI r2, 218
LDI r3, 147
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
