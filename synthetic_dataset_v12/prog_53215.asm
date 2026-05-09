; DESCRIPTION: Renders a white disk with center (159, 26) and radius 19.
; PLAN: r0=159(x), r1=26(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 26
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
