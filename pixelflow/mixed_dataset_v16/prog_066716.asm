; DESCRIPTION: Renders a white disk with center (494, 101) and radius 13.
; PLAN: r0=494(x), r1=101(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 494
LDI r1, 101
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
