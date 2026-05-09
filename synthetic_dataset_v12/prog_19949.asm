; DESCRIPTION: Renders a yellow disk with center (421, 84) and radius 68.
; PLAN: r0=421(x), r1=84(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 84
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
