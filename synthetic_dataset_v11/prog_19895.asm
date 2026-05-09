; DESCRIPTION: Renders a yellow disk with center (93, 101) and radius 73.
; PLAN: r0=93(x), r1=101(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 101
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
