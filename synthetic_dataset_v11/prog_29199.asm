; DESCRIPTION: Places a orange line segment connecting (43, 156) to (132, 245).
; PLAN: r0=43(x1), r1=156(y1), r2=132(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 156
LDI r2, 132
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
