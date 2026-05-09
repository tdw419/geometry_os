; DESCRIPTION: Renders a purple line between points (315, 110) and (182, 101).
; PLAN: r0=315(x1), r1=110(y1), r2=182(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 110
LDI r2, 182
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
