; DESCRIPTION: Renders a purple line between points (22, 0) and (78, 116).
; PLAN: r0=22(x1), r1=0(y1), r2=78(x2), r3=116(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 0
LDI r2, 78
LDI r3, 116
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
