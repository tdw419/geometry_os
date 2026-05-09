; DESCRIPTION: Renders a white disk with center (232, 90) and radius 23.
; PLAN: r0=232(x), r1=90(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 90
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
