; DESCRIPTION: Creates a black circular shape at (28, 199) with radius 15.
; PLAN: r0=28(x), r1=199(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 28
LDI r1, 199
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
