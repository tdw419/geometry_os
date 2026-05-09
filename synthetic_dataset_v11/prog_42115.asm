; DESCRIPTION: Renders a yellow disk with center (103, 161) and radius 62.
; PLAN: r0=103(x), r1=161(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 161
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
