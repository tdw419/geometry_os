; DESCRIPTION: Renders a purple line between points (9, 139) and (237, 119).
; PLAN: r0=9(x1), r1=139(y1), r2=237(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 139
LDI r2, 237
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
