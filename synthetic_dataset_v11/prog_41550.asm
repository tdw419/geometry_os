; DESCRIPTION: Renders a purple line between points (94, 14) and (201, 72).
; PLAN: r0=94(x1), r1=14(y1), r2=201(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 14
LDI r2, 201
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
