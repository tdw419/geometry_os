; DESCRIPTION: Renders a purple line between points (274, 29) and (339, 15).
; PLAN: r0=274(x1), r1=29(y1), r2=339(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 29
LDI r2, 339
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
