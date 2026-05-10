; DESCRIPTION: Renders a white disk with center (96, 92) and radius 47.
; PLAN: r0=96(x), r1=92(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 92
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
