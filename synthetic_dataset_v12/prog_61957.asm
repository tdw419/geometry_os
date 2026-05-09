; DESCRIPTION: Renders a yellow disk with center (170, 67) and radius 45.
; PLAN: r0=170(x), r1=67(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 67
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
