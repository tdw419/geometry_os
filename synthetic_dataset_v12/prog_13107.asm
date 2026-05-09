; DESCRIPTION: Creates a black circular shape at (41, 166) with radius 32.
; PLAN: r0=41(x), r1=166(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 166
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
