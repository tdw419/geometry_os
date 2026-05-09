; DESCRIPTION: Creates a black circular shape at (144, 199) with radius 12.
; PLAN: r0=144(x), r1=199(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 199
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
