; DESCRIPTION: Renders a purple line between points (6, 19) and (175, 106).
; PLAN: r0=6(x1), r1=19(y1), r2=175(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 19
LDI r2, 175
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
