; DESCRIPTION: Renders a white disk with center (76, 222) and radius 28.
; PLAN: r0=76(x), r1=222(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 222
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
