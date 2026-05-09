; DESCRIPTION: Renders a yellow disk with center (197, 136) and radius 12.
; PLAN: r0=197(x), r1=136(y), r2=12(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 136
LDI r2, 12
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
