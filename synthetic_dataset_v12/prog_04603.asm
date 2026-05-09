; DESCRIPTION: Places a orange line segment connecting (232, 139) to (459, 1).
; PLAN: r0=232(x1), r1=139(y1), r2=459(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 139
LDI r2, 459
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
