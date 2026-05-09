; DESCRIPTION: Creates a black circular shape at (384, 126) with radius 78.
; PLAN: r0=384(x), r1=126(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 126
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
