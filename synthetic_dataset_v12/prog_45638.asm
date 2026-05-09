; DESCRIPTION: Renders a white disk with center (217, 183) and radius 69.
; PLAN: r0=217(x), r1=183(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 183
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
