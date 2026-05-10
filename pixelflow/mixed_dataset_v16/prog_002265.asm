; DESCRIPTION: Places a orange line segment connecting (358, 5) to (379, 155).
; PLAN: r0=358(x1), r1=5(y1), r2=379(x2), r3=155(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 5
LDI r2, 379
LDI r3, 155
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
