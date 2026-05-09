; DESCRIPTION: Renders a purple line between points (132, 142) and (163, 52).
; PLAN: r0=132(x1), r1=142(y1), r2=163(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 142
LDI r2, 163
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
