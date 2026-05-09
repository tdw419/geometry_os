; DESCRIPTION: Renders a purple line between points (78, 240) and (147, 88).
; PLAN: r0=78(x1), r1=240(y1), r2=147(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 240
LDI r2, 147
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
