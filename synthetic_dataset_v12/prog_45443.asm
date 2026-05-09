; DESCRIPTION: Draws a yellow circle centered at (65, 181) with radius 32.
; PLAN: r0=65(x), r1=181(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 65
LDI r1, 181
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
