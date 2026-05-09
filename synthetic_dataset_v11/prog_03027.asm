; DESCRIPTION: Draws a black circle centered at (188, 161) with radius 10.
; PLAN: r0=188(x), r1=161(y), r2=10(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 161
LDI r2, 10
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
