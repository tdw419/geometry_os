; DESCRIPTION: Creates a black circular shape at (342, 32) with radius 15.
; PLAN: r0=342(x), r1=32(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 32
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
