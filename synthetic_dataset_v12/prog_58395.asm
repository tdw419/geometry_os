; DESCRIPTION: Renders a yellow disk with center (290, 158) and radius 59.
; PLAN: r0=290(x), r1=158(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 158
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
