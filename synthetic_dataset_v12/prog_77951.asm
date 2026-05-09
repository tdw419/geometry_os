; DESCRIPTION: Places a orange line segment connecting (211, 0) to (379, 123).
; PLAN: r0=211(x1), r1=0(y1), r2=379(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 0
LDI r2, 379
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
