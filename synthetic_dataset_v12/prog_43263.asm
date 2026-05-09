; DESCRIPTION: Places a orange line segment connecting (501, 60) to (358, 203).
; PLAN: r0=501(x1), r1=60(y1), r2=358(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 60
LDI r2, 358
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
