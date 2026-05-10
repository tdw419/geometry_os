; DESCRIPTION: Renders a white disk with center (233, 109) and radius 49.
; PLAN: r0=233(x), r1=109(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 109
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
