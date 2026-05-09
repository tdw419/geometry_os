; DESCRIPTION: Renders a black disk with center (105, 95) and radius 79.
; PLAN: r0=105(x), r1=95(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 95
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
