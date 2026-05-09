; DESCRIPTION: Renders a white disk with center (414, 55) and radius 45.
; PLAN: r0=414(x), r1=55(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 414
LDI r1, 55
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
