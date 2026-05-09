; DESCRIPTION: Places a orange line segment connecting (142, 135) to (101, 78).
; PLAN: r0=142(x1), r1=135(y1), r2=101(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 135
LDI r2, 101
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
