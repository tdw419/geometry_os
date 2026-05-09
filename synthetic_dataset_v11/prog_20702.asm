; DESCRIPTION: Places a orange line segment connecting (112, 218) to (6, 53).
; PLAN: r0=112(x1), r1=218(y1), r2=6(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 218
LDI r2, 6
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
