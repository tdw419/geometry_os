; DESCRIPTION: Places a black circle of radius 39 at center (139, 201).
; PLAN: r0=139(x), r1=201(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 201
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
