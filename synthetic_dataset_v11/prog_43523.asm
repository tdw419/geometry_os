; DESCRIPTION: Renders a black disk with center (177, 98) and radius 24.
; PLAN: r0=177(x), r1=98(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 98
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
