; DESCRIPTION: Renders a yellow disk with center (109, 76) and radius 44.
; PLAN: r0=109(x), r1=76(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 76
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
