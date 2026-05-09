; DESCRIPTION: Creates a white circular shape at (291, 78) with radius 28.
; PLAN: r0=291(x), r1=78(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 78
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
