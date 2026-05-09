; DESCRIPTION: Places a orange circle of radius 34 at center (201, 108).
; PLAN: r0=201(x), r1=108(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 108
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
