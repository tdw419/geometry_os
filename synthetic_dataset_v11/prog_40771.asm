; DESCRIPTION: Renders a blue disk with center (226, 29) and radius 10.
; PLAN: r0=226(x), r1=29(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 29
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
