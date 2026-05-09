; DESCRIPTION: Creates a white circular shape at (166, 224) with radius 16.
; PLAN: r0=166(x), r1=224(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 224
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
