; DESCRIPTION: Places a purple circle of radius 38 at center (301, 201).
; PLAN: r0=301(x), r1=201(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 201
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
