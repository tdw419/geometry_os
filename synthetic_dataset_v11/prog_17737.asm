; DESCRIPTION: Places a yellow circle of radius 34 at center (87, 201).
; PLAN: r0=87(x), r1=201(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 201
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
