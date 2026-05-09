; DESCRIPTION: Places a orange line segment connecting (348, 222) to (454, 4).
; PLAN: r0=348(x1), r1=222(y1), r2=454(x2), r3=4(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 222
LDI r2, 454
LDI r3, 4
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
