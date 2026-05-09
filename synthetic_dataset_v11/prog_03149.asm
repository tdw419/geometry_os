; DESCRIPTION: Places a orange line segment connecting (56, 86) to (204, 32).
; PLAN: r0=56(x1), r1=86(y1), r2=204(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 86
LDI r2, 204
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
