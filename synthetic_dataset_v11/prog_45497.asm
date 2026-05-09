; DESCRIPTION: Renders a purple line between points (15, 190) and (29, 22).
; PLAN: r0=15(x1), r1=190(y1), r2=29(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 190
LDI r2, 29
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
