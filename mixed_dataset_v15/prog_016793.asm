; DESCRIPTION: Places a orange line segment connecting (101, 253) to (135, 78).
; PLAN: r0=101(x1), r1=253(y1), r2=135(x2), r3=78(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 253
LDI r2, 135
LDI r3, 78
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
