; DESCRIPTION: Creates a black circular shape at (57, 165) with radius 39.
; PLAN: r0=57(x), r1=165(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 165
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
