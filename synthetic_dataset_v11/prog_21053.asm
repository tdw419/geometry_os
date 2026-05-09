; DESCRIPTION: Renders a white disk with center (204, 96) and radius 34.
; PLAN: r0=204(x), r1=96(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 96
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
