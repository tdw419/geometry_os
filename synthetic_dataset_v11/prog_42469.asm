; DESCRIPTION: Renders a white disk with center (105, 103) and radius 18.
; PLAN: r0=105(x), r1=103(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 103
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
