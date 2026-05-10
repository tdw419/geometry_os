; DESCRIPTION: Creates a black circular shape at (354, 155) with radius 57.
; PLAN: r0=354(x), r1=155(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 354
LDI r1, 155
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
