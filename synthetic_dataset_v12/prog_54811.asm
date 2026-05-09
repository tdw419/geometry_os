; DESCRIPTION: Renders a white disk with center (351, 83) and radius 74.
; PLAN: r0=351(x), r1=83(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 83
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
