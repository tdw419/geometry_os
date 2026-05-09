; DESCRIPTION: Renders a yellow disk with center (119, 197) and radius 20.
; PLAN: r0=119(x), r1=197(y), r2=20(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 197
LDI r2, 20
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
