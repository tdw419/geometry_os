; DESCRIPTION: Creates a blue circular shape at (50, 224) with radius 24.
; PLAN: r0=50(x), r1=224(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 224
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
