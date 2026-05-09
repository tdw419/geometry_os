; DESCRIPTION: Places a orange line segment connecting (34, 157) to (8, 148).
; PLAN: r0=34(x1), r1=157(y1), r2=8(x2), r3=148(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 157
LDI r2, 8
LDI r3, 148
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
