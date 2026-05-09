; DESCRIPTION: Creates a white circular shape at (120, 130) with radius 49.
; PLAN: r0=120(x), r1=130(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 130
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
