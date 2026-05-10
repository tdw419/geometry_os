; DESCRIPTION: Renders a black disk with center (340, 140) and radius 53.
; PLAN: r0=340(x), r1=140(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 140
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
