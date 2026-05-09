; DESCRIPTION: Places a orange line segment connecting (348, 174) to (67, 179).
; PLAN: r0=348(x1), r1=174(y1), r2=67(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 174
LDI r2, 67
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
