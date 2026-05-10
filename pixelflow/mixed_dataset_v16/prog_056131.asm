; DESCRIPTION: Renders a black disk with center (202, 203) and radius 51.
; PLAN: r0=202(x), r1=203(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 203
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
