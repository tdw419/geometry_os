; DESCRIPTION: Renders a black disk with center (182, 140) and radius 37.
; PLAN: r0=182(x), r1=140(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 140
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
