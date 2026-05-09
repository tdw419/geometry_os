; DESCRIPTION: Renders a yellow disk with center (130, 163) and radius 71.
; PLAN: r0=130(x), r1=163(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 163
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
