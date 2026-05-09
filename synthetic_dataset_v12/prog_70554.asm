; DESCRIPTION: Renders a white disk with center (351, 96) and radius 66.
; PLAN: r0=351(x), r1=96(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 96
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
