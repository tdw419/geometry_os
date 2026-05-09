; DESCRIPTION: Renders a yellow disk with center (119, 175) and radius 13.
; PLAN: r0=119(x), r1=175(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 175
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
