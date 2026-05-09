; DESCRIPTION: Renders a yellow disk with center (40, 99) and radius 24.
; PLAN: r0=40(x), r1=99(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 99
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
