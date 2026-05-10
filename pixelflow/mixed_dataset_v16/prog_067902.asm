; DESCRIPTION: Renders a yellow disk with center (339, 25) and radius 25.
; PLAN: r0=339(x), r1=25(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 25
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
