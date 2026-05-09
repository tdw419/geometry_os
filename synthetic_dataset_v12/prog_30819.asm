; DESCRIPTION: Renders a blue disk with center (195, 29) and radius 11.
; PLAN: r0=195(x), r1=29(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 29
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
