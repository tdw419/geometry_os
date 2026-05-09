; DESCRIPTION: Renders a blue disk with center (191, 140) and radius 32.
; PLAN: r0=191(x), r1=140(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 140
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
