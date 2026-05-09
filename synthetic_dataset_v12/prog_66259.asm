; DESCRIPTION: Renders a white disk with center (309, 124) and radius 69.
; PLAN: r0=309(x), r1=124(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 309
LDI r1, 124
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
