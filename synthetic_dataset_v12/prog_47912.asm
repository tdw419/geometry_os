; DESCRIPTION: Renders a white disk with center (75, 89) and radius 39.
; PLAN: r0=75(x), r1=89(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 89
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
