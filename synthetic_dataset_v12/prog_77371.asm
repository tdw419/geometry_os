; DESCRIPTION: Places a orange line segment connecting (238, 246) to (52, 47).
; PLAN: r0=238(x1), r1=246(y1), r2=52(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 246
LDI r2, 52
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
