; DESCRIPTION: Renders a black disk with center (138, 57) and radius 14.
; PLAN: r0=138(x), r1=57(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 57
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
