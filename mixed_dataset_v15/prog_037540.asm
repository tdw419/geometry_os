; DESCRIPTION: Creates a black circular shape at (265, 38) with radius 33.
; PLAN: r0=265(x), r1=38(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 38
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
