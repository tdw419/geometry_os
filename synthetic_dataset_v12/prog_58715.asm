; DESCRIPTION: Renders a yellow disk with center (204, 75) and radius 60.
; PLAN: r0=204(x), r1=75(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 75
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
