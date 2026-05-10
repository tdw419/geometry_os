; DESCRIPTION: Renders a purple line between points (163, 179) and (118, 105).
; PLAN: r0=163(x1), r1=179(y1), r2=118(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 179
LDI r2, 118
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
