; DESCRIPTION: Places a orange line segment connecting (93, 135) to (134, 185).
; PLAN: r0=93(x1), r1=135(y1), r2=134(x2), r3=185(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 135
LDI r2, 134
LDI r3, 185
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
