; DESCRIPTION: Creates a black circular shape at (270, 130) with radius 13.
; PLAN: r0=270(x), r1=130(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 130
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
