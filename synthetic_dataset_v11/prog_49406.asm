; DESCRIPTION: Places a purple circle of radius 45 at center (141, 201).
; PLAN: r0=141(x), r1=201(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 201
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
