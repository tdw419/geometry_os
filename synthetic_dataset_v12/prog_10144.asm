; DESCRIPTION: Creates a blue circular shape at (224, 185) with radius 52.
; PLAN: r0=224(x), r1=185(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 185
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
