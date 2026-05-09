; DESCRIPTION: Creates a black circular shape at (165, 232) with radius 16.
; PLAN: r0=165(x), r1=232(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 232
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
