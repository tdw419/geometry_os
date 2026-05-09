; DESCRIPTION: Places a orange line segment connecting (503, 227) to (385, 203).
; PLAN: r0=503(x1), r1=227(y1), r2=385(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 227
LDI r2, 385
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
