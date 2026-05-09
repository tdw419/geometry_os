; DESCRIPTION: Places a orange line segment connecting (142, 191) to (341, 97).
; PLAN: r0=142(x1), r1=191(y1), r2=341(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 191
LDI r2, 341
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
