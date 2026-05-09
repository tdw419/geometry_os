; DESCRIPTION: Draws a yellow circle centered at (17, 149) with radius 13.
; PLAN: r0=17(x), r1=149(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 149
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
