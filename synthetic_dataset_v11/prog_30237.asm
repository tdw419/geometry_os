; DESCRIPTION: Places a purple circle of radius 69 at center (119, 163).
; PLAN: r0=119(x), r1=163(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 163
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
