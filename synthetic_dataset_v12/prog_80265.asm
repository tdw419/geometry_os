; DESCRIPTION: Renders a white disk with center (211, 101) and radius 40.
; PLAN: r0=211(x), r1=101(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 211
LDI r1, 101
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
