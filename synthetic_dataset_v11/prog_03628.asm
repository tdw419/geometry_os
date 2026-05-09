; DESCRIPTION: Places a orange line segment connecting (137, 107) to (112, 78).
; PLAN: r0=137(x1), r1=107(y1), r2=112(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 107
LDI r2, 112
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
