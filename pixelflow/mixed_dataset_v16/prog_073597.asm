; DESCRIPTION: Renders a orange line segment connecting (114, 119) to (184, 65).
; PLAN: r0=114(x1), r1=119(y1), r2=184(x2), r3=65(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 119
LDI r2, 184
LDI r3, 65
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
