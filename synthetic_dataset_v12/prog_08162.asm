; DESCRIPTION: Creates a green circular shape at (301, 224) with radius 29.
; PLAN: r0=301(x), r1=224(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 301
LDI r1, 224
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
