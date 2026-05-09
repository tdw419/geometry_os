; DESCRIPTION: Renders a white disk with center (315, 134) and radius 52.
; PLAN: r0=315(x), r1=134(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 315
LDI r1, 134
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
