; DESCRIPTION: Creates a black circular shape at (326, 111) with radius 64.
; PLAN: r0=326(x), r1=111(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 111
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
