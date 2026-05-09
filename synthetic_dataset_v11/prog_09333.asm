; DESCRIPTION: Places a orange line segment connecting (101, 49) to (165, 12).
; PLAN: r0=101(x1), r1=49(y1), r2=165(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 49
LDI r2, 165
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
