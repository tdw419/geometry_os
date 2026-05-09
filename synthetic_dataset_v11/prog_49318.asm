; DESCRIPTION: Renders a black disk with center (138, 115) and radius 77.
; PLAN: r0=138(x), r1=115(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 115
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
