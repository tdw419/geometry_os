; DESCRIPTION: Renders a white disk with center (347, 83) and radius 39.
; PLAN: r0=347(x), r1=83(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 347
LDI r1, 83
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
