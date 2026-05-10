; DESCRIPTION: Renders a white disk with center (122, 183) and radius 35.
; PLAN: r0=122(x), r1=183(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 183
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
