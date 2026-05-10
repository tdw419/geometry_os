; DESCRIPTION: Renders a yellow circular shape at (149, 123) with radius 13.
; PLAN: r0=149(x), r1=123(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 123
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
