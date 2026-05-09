; DESCRIPTION: Renders a purple line between points (390, 164) and (200, 238).
; PLAN: r0=390(x1), r1=164(y1), r2=200(x2), r3=238(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 164
LDI r2, 200
LDI r3, 238
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
