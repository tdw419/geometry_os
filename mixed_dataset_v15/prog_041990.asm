; DESCRIPTION: Renders a white disk with center (37, 225) and radius 29.
; PLAN: r0=37(x), r1=225(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 225
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
