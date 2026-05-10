; DESCRIPTION: Renders a purple line segment connecting (177, 81) to (15, 18).
; PLAN: r0=177(x1), r1=81(y1), r2=15(x2), r3=18(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 81
LDI r2, 15
LDI r3, 18
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
