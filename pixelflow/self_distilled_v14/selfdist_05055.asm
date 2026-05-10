; DESCRIPTION: Renders a purple line segment connecting (311, 135) to (205, 179).
; PLAN: r0=311(x1), r1=135(y1), r2=205(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 135
LDI r2, 205
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
