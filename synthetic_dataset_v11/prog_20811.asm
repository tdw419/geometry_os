; DESCRIPTION: Renders a black disk with center (170, 180) and radius 62.
; PLAN: r0=170(x), r1=180(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 180
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
