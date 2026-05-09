; DESCRIPTION: Renders a purple line between points (226, 105) and (47, 17).
; PLAN: r0=226(x1), r1=105(y1), r2=47(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 105
LDI r2, 47
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
