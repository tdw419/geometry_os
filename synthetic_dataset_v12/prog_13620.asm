; DESCRIPTION: Places a orange line segment connecting (304, 199) to (503, 191).
; PLAN: r0=304(x1), r1=199(y1), r2=503(x2), r3=191(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 199
LDI r2, 503
LDI r3, 191
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
