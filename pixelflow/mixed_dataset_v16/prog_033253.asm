; DESCRIPTION: Renders a black disk with center (216, 46) and radius 24.
; PLAN: r0=216(x), r1=46(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 46
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
