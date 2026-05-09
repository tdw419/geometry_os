; DESCRIPTION: Places a orange line segment connecting (409, 245) to (137, 244).
; PLAN: r0=409(x1), r1=245(y1), r2=137(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 245
LDI r2, 137
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
