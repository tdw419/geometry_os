; DESCRIPTION: Places a orange line segment connecting (93, 25) to (497, 199).
; PLAN: r0=93(x1), r1=25(y1), r2=497(x2), r3=199(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 25
LDI r2, 497
LDI r3, 199
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
