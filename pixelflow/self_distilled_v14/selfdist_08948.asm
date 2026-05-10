; DESCRIPTION: Draws a yellow circle centered at (337, 19) with radius 58.
; PLAN: r0=337(x), r1=19(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 19
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
