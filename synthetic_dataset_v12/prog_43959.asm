; DESCRIPTION: Renders a white disk with center (25, 69) and radius 14.
; PLAN: r0=25(x), r1=69(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 69
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
