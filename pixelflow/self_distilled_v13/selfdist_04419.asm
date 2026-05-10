; DESCRIPTION: Renders a purple line segment connecting (321, 134) to (279, 194).
; PLAN: r0=321(x1), r1=134(y1), r2=279(x2), r3=194(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 134
LDI r2, 279
LDI r3, 194
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
