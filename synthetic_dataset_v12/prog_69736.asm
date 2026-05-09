; DESCRIPTION: Places a purple line segment connecting (201, 217) to (156, 92).
; PLAN: r0=201(x1), r1=217(y1), r2=156(x2), r3=92(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 217
LDI r2, 156
LDI r3, 92
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
