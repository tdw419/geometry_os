; DESCRIPTION: Renders a yellow disk with center (145, 105) and radius 11.
; PLAN: r0=145(x), r1=105(y), r2=11(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 105
LDI r2, 11
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
