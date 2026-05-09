; DESCRIPTION: Renders a blue disk with center (139, 151) and radius 71.
; PLAN: r0=139(x), r1=151(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 151
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
