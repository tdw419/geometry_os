; DESCRIPTION: Creates a orange circular shape at (382, 224) with radius 10.
; PLAN: r0=382(x), r1=224(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 224
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
