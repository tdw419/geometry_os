; DESCRIPTION: Renders a yellow disk with center (139, 153) and radius 75.
; PLAN: r0=139(x), r1=153(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 153
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
