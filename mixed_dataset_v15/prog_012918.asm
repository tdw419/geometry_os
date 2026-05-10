; DESCRIPTION: Creates a purple circular shape at (384, 163) with radius 57.
; PLAN: r0=384(x), r1=163(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 163
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
