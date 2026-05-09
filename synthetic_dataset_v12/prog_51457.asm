; DESCRIPTION: Creates a black circular shape at (373, 172) with radius 18.
; PLAN: r0=373(x), r1=172(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 373
LDI r1, 172
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
