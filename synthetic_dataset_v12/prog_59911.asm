; DESCRIPTION: Renders a yellow disk with center (232, 78) and radius 61.
; PLAN: r0=232(x), r1=78(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 232
LDI r1, 78
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
