; DESCRIPTION: Places a purple line segment connecting (201, 176) to (11, 2).
; PLAN: r0=201(x1), r1=176(y1), r2=11(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 176
LDI r2, 11
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
