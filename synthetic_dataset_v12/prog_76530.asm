; DESCRIPTION: Creates a blue circular shape at (341, 64) with radius 53.
; PLAN: r0=341(x), r1=64(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 64
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
