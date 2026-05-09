; DESCRIPTION: Renders a yellow disk with center (254, 58) and radius 43.
; PLAN: r0=254(x), r1=58(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 58
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
