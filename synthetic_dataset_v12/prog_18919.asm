; DESCRIPTION: Renders a blue line between points (158, 213) and (116, 88).
; PLAN: r0=158(x1), r1=213(y1), r2=116(x2), r3=88(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 213
LDI r2, 116
LDI r3, 88
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
