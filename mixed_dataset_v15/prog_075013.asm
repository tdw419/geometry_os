; DESCRIPTION: Places a orange line segment connecting (227, 246) to (101, 134).
; PLAN: r0=227(x1), r1=246(y1), r2=101(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 246
LDI r2, 101
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
