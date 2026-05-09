; DESCRIPTION: Renders a purple line between points (342, 56) and (136, 43).
; PLAN: r0=342(x1), r1=56(y1), r2=136(x2), r3=43(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 56
LDI r2, 136
LDI r3, 43
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
