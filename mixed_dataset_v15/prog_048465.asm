; DESCRIPTION: Draws a black circle centered at (423, 153) with radius 46.
; PLAN: r0=423(x), r1=153(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 153
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
