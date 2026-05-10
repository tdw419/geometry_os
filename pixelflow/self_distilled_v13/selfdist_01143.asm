; DESCRIPTION: Renders a purple line segment connecting (317, 148) to (194, 66).
; PLAN: r0=317(x1), r1=148(y1), r2=194(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 148
LDI r2, 194
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
