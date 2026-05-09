; DESCRIPTION: Places a purple line segment connecting (357, 3) to (109, 0).
; PLAN: r0=357(x1), r1=3(y1), r2=109(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 3
LDI r2, 109
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
