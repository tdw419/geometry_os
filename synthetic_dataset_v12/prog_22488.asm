; DESCRIPTION: Renders a purple line between points (232, 136) and (364, 60).
; PLAN: r0=232(x1), r1=136(y1), r2=364(x2), r3=60(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 136
LDI r2, 364
LDI r3, 60
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
