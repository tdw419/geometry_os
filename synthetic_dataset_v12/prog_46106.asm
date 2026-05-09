; DESCRIPTION: Renders a orange disk with center (378, 167) and radius 21.
; PLAN: r0=378(x), r1=167(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 167
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
