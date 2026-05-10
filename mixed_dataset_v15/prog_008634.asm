; DESCRIPTION: Renders a purple line segment connecting (319, 199) to (179, 70).
; PLAN: r0=319(x1), r1=199(y1), r2=179(x2), r3=70(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 199
LDI r2, 179
LDI r3, 70
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
