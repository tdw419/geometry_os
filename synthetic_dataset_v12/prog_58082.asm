; DESCRIPTION: Renders a white disk with center (375, 207) and radius 47.
; PLAN: r0=375(x), r1=207(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 207
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
