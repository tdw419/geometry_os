; DESCRIPTION: Renders a yellow disk with center (324, 105) and radius 26.
; PLAN: r0=324(x), r1=105(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 105
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
