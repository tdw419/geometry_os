; DESCRIPTION: Places a orange line segment connecting (461, 11) to (474, 226).
; PLAN: r0=461(x1), r1=11(y1), r2=474(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 11
LDI r2, 474
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
