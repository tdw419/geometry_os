; DESCRIPTION: Renders a purple line segment connecting (238, 123) to (10, 156).
; PLAN: r0=238(x1), r1=123(y1), r2=10(x2), r3=156(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 123
LDI r2, 10
LDI r3, 156
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
