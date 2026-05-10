; DESCRIPTION: Renders a white disk with center (341, 154) and radius 40.
; PLAN: r0=341(x), r1=154(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 341
LDI r1, 154
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
