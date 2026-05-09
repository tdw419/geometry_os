; DESCRIPTION: Creates a white circular shape at (384, 128) with radius 61.
; PLAN: r0=384(x), r1=128(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 128
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
