; DESCRIPTION: Creates a black circular shape at (234, 63) with radius 20.
; PLAN: r0=234(x), r1=63(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 63
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
