; DESCRIPTION: Creates a black circular shape at (100, 209) with radius 33.
; PLAN: r0=100(x), r1=209(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 209
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
