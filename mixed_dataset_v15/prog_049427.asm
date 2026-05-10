; DESCRIPTION: Renders a yellow disk with center (44, 101) and radius 39.
; PLAN: r0=44(x), r1=101(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 101
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
