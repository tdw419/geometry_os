; DESCRIPTION: Creates a black circular shape at (170, 76) with radius 63.
; PLAN: r0=170(x), r1=76(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 76
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
