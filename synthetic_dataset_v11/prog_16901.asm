; DESCRIPTION: Renders a black disk with center (238, 220) and radius 17.
; PLAN: r0=238(x), r1=220(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 220
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
