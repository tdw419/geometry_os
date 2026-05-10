; DESCRIPTION: Places a orange line segment connecting (501, 19) to (459, 232).
; PLAN: r0=501(x1), r1=19(y1), r2=459(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 19
LDI r2, 459
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
