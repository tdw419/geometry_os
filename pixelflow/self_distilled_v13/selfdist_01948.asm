; DESCRIPTION: Renders a purple line segment connecting (148, 89) to (53, 1).
; PLAN: r0=148(x1), r1=89(y1), r2=53(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 89
LDI r2, 53
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
