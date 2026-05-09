; DESCRIPTION: Renders a white disk with center (351, 35) and radius 14.
; PLAN: r0=351(x), r1=35(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 35
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
