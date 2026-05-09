; DESCRIPTION: Renders a white disk with center (204, 108) and radius 36.
; PLAN: r0=204(x), r1=108(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 108
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
