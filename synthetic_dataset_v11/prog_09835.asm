; DESCRIPTION: Renders a black disk with center (161, 96) and radius 77.
; PLAN: r0=161(x), r1=96(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 96
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
