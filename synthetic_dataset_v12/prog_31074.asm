; DESCRIPTION: Renders a yellow disk with center (117, 110) and radius 67.
; PLAN: r0=117(x), r1=110(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 110
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
