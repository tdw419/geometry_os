; DESCRIPTION: Renders a white disk with center (140, 225) and radius 30.
; PLAN: r0=140(x), r1=225(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 225
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
