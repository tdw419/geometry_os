; DESCRIPTION: Draws a yellow circle centered at (17, 0) with radius 60.
; PLAN: r0=17(x), r1=0(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 0
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
