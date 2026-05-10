; DESCRIPTION: Renders a orange line segment connecting (195, 76) to (175, 22).
; PLAN: r0=195(x1), r1=76(y1), r2=175(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 76
LDI r2, 175
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
