; DESCRIPTION: Renders a purple line between points (165, 110) and (253, 116).
; PLAN: r0=165(x1), r1=110(y1), r2=253(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 110
LDI r2, 253
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
