; DESCRIPTION: Renders a white disk with center (183, 87) and radius 19.
; PLAN: r0=183(x), r1=87(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 87
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
