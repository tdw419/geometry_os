; DESCRIPTION: Renders a yellow disk with center (53, 89) and radius 35.
; PLAN: r0=53(x), r1=89(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 89
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
