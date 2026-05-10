; DESCRIPTION: Places a orange circle of radius 25 at center (151, 201).
; PLAN: r0=151(x), r1=201(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 201
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
