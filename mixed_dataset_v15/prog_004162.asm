; DESCRIPTION: Renders a purple line segment connecting (214, 86) to (62, 35).
; PLAN: r0=214(x1), r1=86(y1), r2=62(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 86
LDI r2, 62
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
