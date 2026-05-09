; DESCRIPTION: Creates a black circular shape at (19, 68) with radius 17.
; PLAN: r0=19(x), r1=68(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 19
LDI r1, 68
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
