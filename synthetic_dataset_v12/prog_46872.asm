; DESCRIPTION: Places a orange line segment connecting (459, 173) to (503, 252).
; PLAN: r0=459(x1), r1=173(y1), r2=503(x2), r3=252(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 173
LDI r2, 503
LDI r3, 252
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
