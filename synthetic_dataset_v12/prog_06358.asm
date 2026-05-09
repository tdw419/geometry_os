; DESCRIPTION: Renders a yellow disk with center (65, 139) and radius 29.
; PLAN: r0=65(x), r1=139(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 139
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
