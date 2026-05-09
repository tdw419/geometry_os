; DESCRIPTION: Creates a black circular shape at (269, 172) with radius 74.
; PLAN: r0=269(x), r1=172(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 269
LDI r1, 172
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
