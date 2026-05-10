; DESCRIPTION: Renders a yellow circular shape at (264, 198) with radius 64.
; PLAN: r0=264(x), r1=198(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 198
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
