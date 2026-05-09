; DESCRIPTION: Places a orange line segment connecting (409, 184) to (252, 31).
; PLAN: r0=409(x1), r1=184(y1), r2=252(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 184
LDI r2, 252
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
