; DESCRIPTION: Renders a yellow disk with center (351, 167) and radius 65.
; PLAN: r0=351(x), r1=167(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 167
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
