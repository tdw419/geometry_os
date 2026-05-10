; DESCRIPTION: Places a orange line segment connecting (459, 77) to (270, 184).
; PLAN: r0=459(x1), r1=77(y1), r2=270(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 77
LDI r2, 270
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
