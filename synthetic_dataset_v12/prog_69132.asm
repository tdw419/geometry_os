; DESCRIPTION: Places a orange line segment connecting (74, 43) to (447, 194).
; PLAN: r0=74(x1), r1=43(y1), r2=447(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 43
LDI r2, 447
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
