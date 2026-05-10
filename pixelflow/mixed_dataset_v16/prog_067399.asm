; DESCRIPTION: Renders a yellow disk with center (223, 155) and radius 52.
; PLAN: r0=223(x), r1=155(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 155
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
