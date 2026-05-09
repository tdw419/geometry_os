; DESCRIPTION: Places a purple line segment connecting (221, 145) to (8, 201).
; PLAN: r0=221(x1), r1=145(y1), r2=8(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 145
LDI r2, 8
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
