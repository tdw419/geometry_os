; DESCRIPTION: Places a orange line segment connecting (11, 104) to (153, 218).
; PLAN: r0=11(x1), r1=104(y1), r2=153(x2), r3=218(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 104
LDI r2, 153
LDI r3, 218
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
