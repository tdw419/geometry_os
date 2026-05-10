; DESCRIPTION: Places a orange line segment connecting (321, 20) to (459, 67).
; PLAN: r0=321(x1), r1=20(y1), r2=459(x2), r3=67(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 20
LDI r2, 459
LDI r3, 67
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
