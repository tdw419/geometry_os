; DESCRIPTION: Creates a black circular shape at (204, 178) with radius 28.
; PLAN: r0=204(x), r1=178(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 178
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
