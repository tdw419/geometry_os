; DESCRIPTION: Renders a purple line between points (163, 1) and (456, 59).
; PLAN: r0=163(x1), r1=1(y1), r2=456(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 1
LDI r2, 456
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
