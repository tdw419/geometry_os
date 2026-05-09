; DESCRIPTION: Places a orange line segment connecting (379, 97) to (383, 48).
; PLAN: r0=379(x1), r1=97(y1), r2=383(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 97
LDI r2, 383
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
