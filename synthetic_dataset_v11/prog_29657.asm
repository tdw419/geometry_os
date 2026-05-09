; DESCRIPTION: Renders a yellow disk with center (188, 198) and radius 19.
; PLAN: r0=188(x), r1=198(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 198
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
