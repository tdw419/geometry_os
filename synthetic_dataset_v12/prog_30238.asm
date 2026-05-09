; DESCRIPTION: Renders a purple disk with center (421, 98) and radius 14.
; PLAN: r0=421(x), r1=98(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 98
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
