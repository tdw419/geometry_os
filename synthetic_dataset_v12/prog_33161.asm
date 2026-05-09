; DESCRIPTION: Renders a yellow disk with center (134, 88) and radius 78.
; PLAN: r0=134(x), r1=88(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 88
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
