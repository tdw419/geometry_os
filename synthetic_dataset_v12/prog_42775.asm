; DESCRIPTION: Renders a white disk with center (272, 77) and radius 75.
; PLAN: r0=272(x), r1=77(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 77
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
