; DESCRIPTION: Renders a yellow disk with center (166, 56) and radius 18.
; PLAN: r0=166(x), r1=56(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 56
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
