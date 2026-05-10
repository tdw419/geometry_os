; DESCRIPTION: Renders a orange line segment connecting (53, 139) to (255, 106).
; PLAN: r0=53(x1), r1=139(y1), r2=255(x2), r3=106(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 139
LDI r2, 255
LDI r3, 106
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
