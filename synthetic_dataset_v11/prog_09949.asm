; DESCRIPTION: Renders a black disk with center (69, 124) and radius 66.
; PLAN: r0=69(x), r1=124(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 124
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
