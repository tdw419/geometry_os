; DESCRIPTION: Renders a white disk with center (216, 105) and radius 28.
; PLAN: r0=216(x), r1=105(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 105
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
