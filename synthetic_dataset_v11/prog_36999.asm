; DESCRIPTION: Renders a purple line between points (205, 81) and (194, 18).
; PLAN: r0=205(x1), r1=81(y1), r2=194(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 81
LDI r2, 194
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
