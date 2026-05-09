; DESCRIPTION: Renders a black disk with center (426, 203) and radius 13.
; PLAN: r0=426(x), r1=203(y), r2=13(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 426
LDI r1, 203
LDI r2, 13
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
