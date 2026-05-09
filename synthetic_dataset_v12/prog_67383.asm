; DESCRIPTION: Renders a yellow disk with center (421, 117) and radius 80.
; PLAN: r0=421(x), r1=117(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 117
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
