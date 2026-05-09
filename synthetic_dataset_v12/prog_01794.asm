; DESCRIPTION: Renders a black disk with center (224, 101) and radius 72.
; PLAN: r0=224(x), r1=101(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 101
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
