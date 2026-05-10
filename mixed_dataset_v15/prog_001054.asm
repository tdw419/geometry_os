; DESCRIPTION: Renders a orange line segment connecting (139, 135) to (291, 190).
; PLAN: r0=139(x1), r1=135(y1), r2=291(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 135
LDI r2, 291
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
