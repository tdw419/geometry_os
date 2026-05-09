; DESCRIPTION: Renders a yellow disk with center (134, 200) and radius 55.
; PLAN: r0=134(x), r1=200(y), r2=55(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 200
LDI r2, 55
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
