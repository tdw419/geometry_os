; DESCRIPTION: Renders a white disk with center (144, 92) and radius 69.
; PLAN: r0=144(x), r1=92(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 92
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
