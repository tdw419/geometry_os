; DESCRIPTION: Renders a yellow disk with center (237, 114) and radius 41.
; PLAN: r0=237(x), r1=114(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 237
LDI r1, 114
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
