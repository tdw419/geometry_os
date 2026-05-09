; DESCRIPTION: Creates a blue circular shape at (204, 189) with radius 17.
; PLAN: r0=204(x), r1=189(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 189
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
