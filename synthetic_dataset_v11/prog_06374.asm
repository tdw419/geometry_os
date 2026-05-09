; DESCRIPTION: Renders a yellow disk with center (181, 139) and radius 60.
; PLAN: r0=181(x), r1=139(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 139
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
