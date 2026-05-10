; DESCRIPTION: Renders a yellow disk with center (159, 103) and radius 59.
; PLAN: r0=159(x), r1=103(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 103
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
