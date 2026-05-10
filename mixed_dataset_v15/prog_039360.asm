; DESCRIPTION: Renders a orange line segment connecting (216, 11) to (332, 139).
; PLAN: r0=216(x1), r1=11(y1), r2=332(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 11
LDI r2, 332
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
