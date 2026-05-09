; DESCRIPTION: Renders a white disk with center (268, 60) and radius 60.
; PLAN: r0=268(x), r1=60(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 60
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
