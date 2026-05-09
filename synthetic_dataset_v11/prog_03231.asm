; DESCRIPTION: Places a orange line segment connecting (37, 169) to (183, 181).
; PLAN: r0=37(x1), r1=169(y1), r2=183(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 169
LDI r2, 183
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
