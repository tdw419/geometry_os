; DESCRIPTION: Renders a white disk with center (80, 140) and radius 24.
; PLAN: r0=80(x), r1=140(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 80
LDI r1, 140
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
