; DESCRIPTION: Renders a purple line segment connecting (200, 12) to (337, 135).
; PLAN: r0=200(x1), r1=12(y1), r2=337(x2), r3=135(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 12
LDI r2, 337
LDI r3, 135
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
