; DESCRIPTION: Renders a green circular shape at (379, 183) with radius 65.
; PLAN: r0=379(x), r1=183(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 183
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
