; DESCRIPTION: Draws a yellow circle centered at (431, 149) with radius 35.
; PLAN: r0=431(x), r1=149(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 149
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
