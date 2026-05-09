; DESCRIPTION: Creates a black circular shape at (102, 165) with radius 78.
; PLAN: r0=102(x), r1=165(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 165
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
