; DESCRIPTION: Renders a purple line segment connecting (112, 92) to (264, 139).
; PLAN: r0=112(x1), r1=92(y1), r2=264(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 92
LDI r2, 264
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
