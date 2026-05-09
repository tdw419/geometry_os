; DESCRIPTION: Renders a yellow disk with center (332, 105) and radius 47.
; PLAN: r0=332(x), r1=105(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 105
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
