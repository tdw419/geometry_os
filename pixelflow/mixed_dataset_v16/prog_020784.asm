; DESCRIPTION: Creates a black circular shape at (65, 67) with radius 55.
; PLAN: r0=65(x), r1=67(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 67
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
