; DESCRIPTION: Renders a green disk with center (351, 184) and radius 35.
; PLAN: r0=351(x), r1=184(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 184
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
