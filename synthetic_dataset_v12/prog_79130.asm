; DESCRIPTION: Renders a orange disk with center (351, 77) and radius 67.
; PLAN: r0=351(x), r1=77(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 77
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
