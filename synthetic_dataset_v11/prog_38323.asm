; DESCRIPTION: Renders a yellow disk with center (134, 55) and radius 36.
; PLAN: r0=134(x), r1=55(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 55
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
