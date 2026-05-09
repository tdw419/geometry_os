; DESCRIPTION: Places a orange line segment connecting (347, 169) to (314, 6).
; PLAN: r0=347(x1), r1=169(y1), r2=314(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 169
LDI r2, 314
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
