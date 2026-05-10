; DESCRIPTION: Renders a magenta circular shape at (224, 119) with radius 14.
; PLAN: r0=224(x), r1=119(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 119
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
