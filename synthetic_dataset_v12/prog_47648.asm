; DESCRIPTION: Renders a purple line between points (201, 251) and (358, 23).
; PLAN: r0=201(x1), r1=251(y1), r2=358(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 251
LDI r2, 358
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
