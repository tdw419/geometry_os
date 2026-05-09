; DESCRIPTION: Creates a black circular shape at (226, 166) with radius 76.
; PLAN: r0=226(x), r1=166(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 166
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
