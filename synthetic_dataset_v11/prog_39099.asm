; DESCRIPTION: Renders a purple line between points (233, 233) and (222, 67).
; PLAN: r0=233(x1), r1=233(y1), r2=222(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 233
LDI r2, 222
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
