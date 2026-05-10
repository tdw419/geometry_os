; DESCRIPTION: Renders a orange line segment connecting (119, 175) to (232, 49).
; PLAN: r0=119(x1), r1=175(y1), r2=232(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 175
LDI r2, 232
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
