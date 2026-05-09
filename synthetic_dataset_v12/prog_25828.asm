; DESCRIPTION: Places a orange line segment connecting (373, 156) to (71, 106).
; PLAN: r0=373(x1), r1=156(y1), r2=71(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 156
LDI r2, 71
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
