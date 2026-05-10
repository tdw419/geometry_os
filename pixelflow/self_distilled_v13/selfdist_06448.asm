; DESCRIPTION: Renders a purple line segment connecting (135, 57) to (134, 20).
; PLAN: r0=135(x1), r1=57(y1), r2=134(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 57
LDI r2, 134
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
