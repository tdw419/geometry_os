; DESCRIPTION: Renders a black disk with center (76, 107) and radius 72.
; PLAN: r0=76(x), r1=107(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 107
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
