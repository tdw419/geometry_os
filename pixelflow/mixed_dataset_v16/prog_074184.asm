; DESCRIPTION: Places a purple circle of radius 23 at center (163, 178).
; PLAN: r0=163(x), r1=178(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 163
LDI r1, 178
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
