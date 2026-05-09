; DESCRIPTION: Renders a black disk with center (183, 95) and radius 46.
; PLAN: r0=183(x), r1=95(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 95
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
