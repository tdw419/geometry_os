; DESCRIPTION: Renders a yellow disk with center (136, 206) and radius 17.
; PLAN: r0=136(x), r1=206(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 206
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
