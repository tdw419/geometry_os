; DESCRIPTION: Renders a white disk with center (43, 241) and radius 15.
; PLAN: r0=43(x), r1=241(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 241
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
