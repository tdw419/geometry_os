; DESCRIPTION: Renders a yellow disk with center (355, 112) and radius 66.
; PLAN: r0=355(x), r1=112(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 112
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
