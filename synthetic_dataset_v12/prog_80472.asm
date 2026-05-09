; DESCRIPTION: Renders a white disk with center (204, 111) and radius 43.
; PLAN: r0=204(x), r1=111(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 111
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
