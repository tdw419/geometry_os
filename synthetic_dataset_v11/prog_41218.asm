; DESCRIPTION: Places a orange line segment connecting (181, 184) to (25, 204).
; PLAN: r0=181(x1), r1=184(y1), r2=25(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 184
LDI r2, 25
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
