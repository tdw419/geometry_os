; DESCRIPTION: Renders a purple disk with center (114, 203) and radius 18.
; PLAN: r0=114(x), r1=203(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 203
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
