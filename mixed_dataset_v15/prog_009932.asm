; DESCRIPTION: Renders a green circular shape at (191, 198) with radius 76.
; PLAN: r0=191(x), r1=198(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 198
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
