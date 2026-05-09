; DESCRIPTION: Creates a white circular shape at (268, 100) with radius 17.
; PLAN: r0=268(x), r1=100(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 100
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
