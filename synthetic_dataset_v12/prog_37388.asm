; DESCRIPTION: Renders a white disk with center (37, 163) and radius 27.
; PLAN: r0=37(x), r1=163(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 163
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
