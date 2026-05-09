; DESCRIPTION: Renders a blue disk with center (256, 151) and radius 37.
; PLAN: r0=256(x), r1=151(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 151
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
