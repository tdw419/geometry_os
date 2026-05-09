; DESCRIPTION: Renders a white disk with center (137, 204) and radius 17.
; PLAN: r0=137(x), r1=204(y), r2=17(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 204
LDI r2, 17
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
