; DESCRIPTION: Creates a magenta circular shape at (15, 224) with radius 10.
; PLAN: r0=15(x), r1=224(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 15
LDI r1, 224
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
