; DESCRIPTION: Renders a purple line between points (436, 101) and (97, 45).
; PLAN: r0=436(x1), r1=101(y1), r2=97(x2), r3=45(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 101
LDI r2, 97
LDI r3, 45
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
