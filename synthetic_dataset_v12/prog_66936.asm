; DESCRIPTION: Creates a black circular shape at (232, 83) with radius 72.
; PLAN: r0=232(x), r1=83(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 83
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
