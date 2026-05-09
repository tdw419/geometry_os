; DESCRIPTION: Renders a purple line between points (50, 116) and (114, 88).
; PLAN: r0=50(x1), r1=116(y1), r2=114(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 116
LDI r2, 114
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
