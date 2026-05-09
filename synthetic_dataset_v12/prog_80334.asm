; DESCRIPTION: Places a orange line segment connecting (506, 49) to (486, 74).
; PLAN: r0=506(x1), r1=49(y1), r2=486(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 49
LDI r2, 486
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
