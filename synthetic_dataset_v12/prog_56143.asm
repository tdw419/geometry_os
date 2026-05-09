; DESCRIPTION: Renders a blue disk with center (238, 150) and radius 33.
; PLAN: r0=238(x), r1=150(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 150
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
