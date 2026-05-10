; DESCRIPTION: Renders a orange line segment connecting (15, 78) to (93, 190).
; PLAN: r0=15(x1), r1=78(y1), r2=93(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 78
LDI r2, 93
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
