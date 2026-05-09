; DESCRIPTION: Renders a purple line between points (297, 178) and (232, 105).
; PLAN: r0=297(x1), r1=178(y1), r2=232(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 178
LDI r2, 232
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
