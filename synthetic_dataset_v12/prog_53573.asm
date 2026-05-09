; DESCRIPTION: Creates a black circular shape at (384, 199) with radius 43.
; PLAN: r0=384(x), r1=199(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 199
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
