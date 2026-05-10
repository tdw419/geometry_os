; DESCRIPTION: Renders a purple line segment connecting (359, 53) to (334, 47).
; PLAN: r0=359(x1), r1=53(y1), r2=334(x2), r3=47(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 53
LDI r2, 334
LDI r3, 47
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
