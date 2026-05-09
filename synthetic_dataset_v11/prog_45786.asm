; DESCRIPTION: Places a purple circle of radius 49 at center (56, 98).
; PLAN: r0=56(x), r1=98(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 98
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
