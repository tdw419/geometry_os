; DESCRIPTION: Creates a black circular shape at (176, 128) with radius 19.
; PLAN: r0=176(x), r1=128(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 128
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
