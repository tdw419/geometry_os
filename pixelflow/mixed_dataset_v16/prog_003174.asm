; DESCRIPTION: Renders a white disk with center (367, 89) and radius 31.
; PLAN: r0=367(x), r1=89(y), r2=31(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 89
LDI r2, 31
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
