; DESCRIPTION: Creates a black circular shape at (247, 219) with radius 30.
; PLAN: r0=247(x), r1=219(y), r2=30(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 219
LDI r2, 30
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
