; DESCRIPTION: Creates a green circular shape at (442, 191) with radius 43.
; PLAN: r0=442(x), r1=191(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 191
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
