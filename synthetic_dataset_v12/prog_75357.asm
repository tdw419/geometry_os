; DESCRIPTION: Renders a white disk with center (280, 176) and radius 48.
; PLAN: r0=280(x), r1=176(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 280
LDI r1, 176
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
