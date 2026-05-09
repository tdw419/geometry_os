; DESCRIPTION: Creates a white circular shape at (268, 103) with radius 64.
; PLAN: r0=268(x), r1=103(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 103
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
