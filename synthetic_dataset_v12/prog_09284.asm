; DESCRIPTION: Renders a orange line between points (153, 23) and (491, 190).
; PLAN: r0=153(x1), r1=23(y1), r2=491(x2), r3=190(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 23
LDI r2, 491
LDI r3, 190
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
