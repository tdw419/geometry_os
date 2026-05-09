; DESCRIPTION: Creates a black circular shape at (366, 64) with radius 24.
; PLAN: r0=366(x), r1=64(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 64
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
