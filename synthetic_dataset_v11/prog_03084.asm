; DESCRIPTION: Creates a black circular shape at (217, 64) with radius 32.
; PLAN: r0=217(x), r1=64(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 64
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
