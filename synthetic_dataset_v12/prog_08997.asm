; DESCRIPTION: Places a orange line segment connecting (457, 232) to (266, 39).
; PLAN: r0=457(x1), r1=232(y1), r2=266(x2), r3=39(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 232
LDI r2, 266
LDI r3, 39
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
