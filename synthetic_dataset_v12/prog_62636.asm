; DESCRIPTION: Renders a white disk with center (49, 200) and radius 22.
; PLAN: r0=49(x), r1=200(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 200
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
