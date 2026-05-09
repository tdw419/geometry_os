; DESCRIPTION: Renders a purple line between points (81, 88) and (205, 25).
; PLAN: r0=81(x1), r1=88(y1), r2=205(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 88
LDI r2, 205
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
