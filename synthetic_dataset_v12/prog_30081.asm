; DESCRIPTION: Renders a purple line between points (382, 201) and (366, 85).
; PLAN: r0=382(x1), r1=201(y1), r2=366(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 201
LDI r2, 366
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
