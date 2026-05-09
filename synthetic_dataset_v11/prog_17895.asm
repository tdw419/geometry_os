; DESCRIPTION: Renders a yellow disk with center (137, 67) and radius 51.
; PLAN: r0=137(x), r1=67(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 67
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
