; DESCRIPTION: Places a purple circle of radius 57 at center (58, 163).
; PLAN: r0=58(x), r1=163(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 163
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
