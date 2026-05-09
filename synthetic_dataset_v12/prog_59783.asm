; DESCRIPTION: Renders a black disk with center (397, 90) and radius 71.
; PLAN: r0=397(x), r1=90(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 90
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
