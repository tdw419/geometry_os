; DESCRIPTION: Renders a purple line between points (269, 17) and (112, 2).
; PLAN: r0=269(x1), r1=17(y1), r2=112(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 17
LDI r2, 112
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
