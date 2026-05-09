; DESCRIPTION: Creates a red circular shape at (211, 224) with radius 13.
; PLAN: r0=211(x), r1=224(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 224
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
