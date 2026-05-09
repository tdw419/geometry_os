; DESCRIPTION: Renders a yellow disk with center (204, 45) and radius 25.
; PLAN: r0=204(x), r1=45(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 45
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
