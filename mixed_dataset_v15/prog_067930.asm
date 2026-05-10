; DESCRIPTION: Renders a white circular shape at (64, 11) with radius 62.
; PLAN: r0=64(x), r1=11(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 11
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
