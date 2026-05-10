; DESCRIPTION: Renders a orange line segment connecting (183, 189) to (6, 139).
; PLAN: r0=183(x1), r1=189(y1), r2=6(x2), r3=139(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 189
LDI r2, 6
LDI r3, 139
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
