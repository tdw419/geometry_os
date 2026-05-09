; DESCRIPTION: Creates a black circular shape at (58, 67) with radius 17.
; PLAN: r0=58(x), r1=67(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 67
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
