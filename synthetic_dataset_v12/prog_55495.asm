; DESCRIPTION: Renders a black disk with center (170, 138) and radius 20.
; PLAN: r0=170(x), r1=138(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 138
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
