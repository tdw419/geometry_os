; DESCRIPTION: Renders a black disk with center (449, 203) and radius 36.
; PLAN: r0=449(x), r1=203(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 203
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
