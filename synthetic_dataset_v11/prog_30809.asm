; DESCRIPTION: Renders a blue disk with center (189, 73) and radius 30.
; PLAN: r0=189(x), r1=73(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 73
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
