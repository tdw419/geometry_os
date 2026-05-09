; DESCRIPTION: Creates a orange circular shape at (359, 224) with radius 15.
; PLAN: r0=359(x), r1=224(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 224
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
