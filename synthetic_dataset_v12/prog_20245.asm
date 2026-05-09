; DESCRIPTION: Places a orange line segment connecting (409, 23) to (211, 42).
; PLAN: r0=409(x1), r1=23(y1), r2=211(x2), r3=42(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 23
LDI r2, 211
LDI r3, 42
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
