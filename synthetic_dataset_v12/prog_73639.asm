; DESCRIPTION: Renders a blue line between points (490, 20) and (97, 230).
; PLAN: r0=490(x1), r1=20(y1), r2=97(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 20
LDI r2, 97
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
