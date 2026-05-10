; DESCRIPTION: Renders a purple line segment connecting (102, 98) to (377, 19).
; PLAN: r0=102(x1), r1=98(y1), r2=377(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 98
LDI r2, 377
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
