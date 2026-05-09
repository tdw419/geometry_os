; DESCRIPTION: Renders a black disk with center (107, 82) and radius 76.
; PLAN: r0=107(x), r1=82(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 82
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
