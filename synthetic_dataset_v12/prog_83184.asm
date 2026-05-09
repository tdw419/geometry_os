; DESCRIPTION: Renders a yellow disk with center (282, 188) and radius 47.
; PLAN: r0=282(x), r1=188(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 188
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
