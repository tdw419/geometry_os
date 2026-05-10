; DESCRIPTION: Places a orange line segment connecting (8, 184) to (109, 212).
; PLAN: r0=8(x1), r1=184(y1), r2=109(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 184
LDI r2, 109
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
