; DESCRIPTION: Renders a white disk with center (151, 121) and radius 37.
; PLAN: r0=151(x), r1=121(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 121
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
