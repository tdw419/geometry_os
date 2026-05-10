; DESCRIPTION: Places a orange line segment connecting (181, 83) to (128, 232).
; PLAN: r0=181(x1), r1=83(y1), r2=128(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 83
LDI r2, 128
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
