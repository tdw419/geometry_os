; DESCRIPTION: Creates a black circular shape at (77, 209) with radius 17.
; PLAN: r0=77(x), r1=209(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 209
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
