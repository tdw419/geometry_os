; DESCRIPTION: Renders a purple line segment connecting (351, 179) to (52, 189).
; PLAN: r0=351(x1), r1=179(y1), r2=52(x2), r3=189(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 179
LDI r2, 52
LDI r3, 189
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
