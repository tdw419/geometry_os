; DESCRIPTION: Renders a purple line between points (163, 49) and (335, 147).
; PLAN: r0=163(x1), r1=49(y1), r2=335(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 49
LDI r2, 335
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
