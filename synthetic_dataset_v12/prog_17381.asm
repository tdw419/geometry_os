; DESCRIPTION: Draws a yellow circle centered at (161, 127) with radius 18.
; PLAN: r0=161(x), r1=127(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 127
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
