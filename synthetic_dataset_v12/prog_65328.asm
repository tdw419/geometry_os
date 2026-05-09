; DESCRIPTION: Places a orange line segment connecting (202, 68) to (421, 232).
; PLAN: r0=202(x1), r1=68(y1), r2=421(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 68
LDI r2, 421
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
