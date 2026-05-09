; DESCRIPTION: Renders a white disk with center (151, 74) and radius 33.
; PLAN: r0=151(x), r1=74(y), r2=33(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 74
LDI r2, 33
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
