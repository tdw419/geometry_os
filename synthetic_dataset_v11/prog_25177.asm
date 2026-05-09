; DESCRIPTION: Renders a yellow disk with center (62, 184) and radius 40.
; PLAN: r0=62(x), r1=184(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 62
LDI r1, 184
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
