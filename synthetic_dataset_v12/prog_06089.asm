; DESCRIPTION: Places a purple circle of radius 31 at center (139, 158).
; PLAN: r0=139(x), r1=158(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 158
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
