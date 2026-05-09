; DESCRIPTION: Renders a purple line between points (141, 105) and (147, 5).
; PLAN: r0=141(x1), r1=105(y1), r2=147(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 105
LDI r2, 147
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
