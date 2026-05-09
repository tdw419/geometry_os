; DESCRIPTION: Creates a black circular shape at (94, 128) with radius 48.
; PLAN: r0=94(x), r1=128(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 128
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
