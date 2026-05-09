; DESCRIPTION: Renders a purple disk with center (310, 122) and radius 64.
; PLAN: r0=310(x), r1=122(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 310
LDI r1, 122
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
