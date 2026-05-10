; DESCRIPTION: Renders a blue disk with center (195, 151) and radius 29.
; PLAN: r0=195(x), r1=151(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 151
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
