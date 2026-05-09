; DESCRIPTION: Renders a white disk with center (88, 143) and radius 62.
; PLAN: r0=88(x), r1=143(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 143
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
