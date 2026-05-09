; DESCRIPTION: Creates a black circular shape at (43, 164) with radius 22.
; PLAN: r0=43(x), r1=164(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 164
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
