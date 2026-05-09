; DESCRIPTION: Renders a blue disk with center (30, 102) and radius 30.
; PLAN: r0=30(x), r1=102(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 30
LDI r1, 102
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
