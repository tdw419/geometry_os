; DESCRIPTION: Renders a purple line between points (141, 90) and (65, 116).
; PLAN: r0=141(x1), r1=90(y1), r2=65(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 90
LDI r2, 65
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
