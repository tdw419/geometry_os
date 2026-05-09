; DESCRIPTION: Renders a purple line between points (163, 39) and (2, 237).
; PLAN: r0=163(x1), r1=39(y1), r2=2(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 39
LDI r2, 2
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
