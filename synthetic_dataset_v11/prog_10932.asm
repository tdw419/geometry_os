; DESCRIPTION: Renders a white disk with center (58, 227) and radius 14.
; PLAN: r0=58(x), r1=227(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 227
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
