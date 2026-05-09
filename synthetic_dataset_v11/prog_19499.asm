; DESCRIPTION: Renders a purple line between points (147, 29) and (191, 135).
; PLAN: r0=147(x1), r1=29(y1), r2=191(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 29
LDI r2, 191
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
