; DESCRIPTION: Creates a black circular shape at (364, 148) with radius 59.
; PLAN: r0=364(x), r1=148(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 148
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
