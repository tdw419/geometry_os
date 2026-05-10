; DESCRIPTION: Draws a yellow circle centered at (162, 32) with radius 17.
; PLAN: r0=162(x), r1=32(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 32
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
