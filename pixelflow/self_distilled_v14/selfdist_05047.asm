; DESCRIPTION: Renders a purple line segment connecting (105, 192) to (376, 102).
; PLAN: r0=105(x1), r1=192(y1), r2=376(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 192
LDI r2, 376
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
