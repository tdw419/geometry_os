; DESCRIPTION: Places a orange line segment connecting (430, 110) to (459, 96).
; PLAN: r0=430(x1), r1=110(y1), r2=459(x2), r3=96(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 110
LDI r2, 459
LDI r3, 96
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
