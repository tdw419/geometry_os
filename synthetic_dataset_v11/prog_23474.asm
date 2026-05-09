; DESCRIPTION: Places a orange line segment connecting (3, 169) to (61, 106).
; PLAN: r0=3(x1), r1=169(y1), r2=61(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 169
LDI r2, 61
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
