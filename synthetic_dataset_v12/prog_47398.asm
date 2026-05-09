; DESCRIPTION: Renders a white disk with center (204, 100) and radius 45.
; PLAN: r0=204(x), r1=100(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 100
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
