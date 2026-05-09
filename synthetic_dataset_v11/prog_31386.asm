; DESCRIPTION: Places a purple circle of radius 13 at center (240, 201).
; PLAN: r0=240(x), r1=201(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 201
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
