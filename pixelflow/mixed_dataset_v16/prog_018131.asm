; DESCRIPTION: Renders a white disk with center (291, 189) and radius 29.
; PLAN: r0=291(x), r1=189(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 189
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
