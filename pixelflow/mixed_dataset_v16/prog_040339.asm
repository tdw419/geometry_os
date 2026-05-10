; DESCRIPTION: Renders a blue line segment connecting (177, 72) to (216, 194).
; PLAN: r0=177(x1), r1=72(y1), r2=216(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 72
LDI r2, 216
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
