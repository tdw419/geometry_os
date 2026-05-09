; DESCRIPTION: Renders a yellow disk with center (170, 103) and radius 62.
; PLAN: r0=170(x), r1=103(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 103
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
