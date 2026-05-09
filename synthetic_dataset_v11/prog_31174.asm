; DESCRIPTION: Renders a yellow disk with center (88, 183) and radius 36.
; PLAN: r0=88(x), r1=183(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 183
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
