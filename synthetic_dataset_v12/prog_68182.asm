; DESCRIPTION: Draws a black circle centered at (158, 181) with radius 46.
; PLAN: r0=158(x), r1=181(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 181
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
