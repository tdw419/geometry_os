; DESCRIPTION: Renders a blue disk with center (178, 136) and radius 27.
; PLAN: r0=178(x), r1=136(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 136
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
