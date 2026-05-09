; DESCRIPTION: Places a orange line segment connecting (56, 128) to (223, 201).
; PLAN: r0=56(x1), r1=128(y1), r2=223(x2), r3=201(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 128
LDI r2, 223
LDI r3, 201
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
