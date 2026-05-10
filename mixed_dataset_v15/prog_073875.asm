; DESCRIPTION: Creates a white circular shape at (382, 130) with radius 69.
; PLAN: r0=382(x), r1=130(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 130
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
