; DESCRIPTION: Renders a purple line between points (76, 246) and (131, 217).
; PLAN: r0=76(x1), r1=246(y1), r2=131(x2), r3=217(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 246
LDI r2, 131
LDI r3, 217
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
