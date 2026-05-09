; DESCRIPTION: Creates a black circular shape at (43, 221) with radius 26.
; PLAN: r0=43(x), r1=221(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 221
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
