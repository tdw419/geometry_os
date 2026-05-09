; DESCRIPTION: Renders a white disk with center (86, 75) and radius 60.
; PLAN: r0=86(x), r1=75(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 75
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
