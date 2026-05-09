; DESCRIPTION: Renders a white disk with center (272, 199) and radius 27.
; PLAN: r0=272(x), r1=199(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 199
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
