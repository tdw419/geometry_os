; DESCRIPTION: Places a orange line segment connecting (379, 210) to (53, 21).
; PLAN: r0=379(x1), r1=210(y1), r2=53(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 210
LDI r2, 53
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
