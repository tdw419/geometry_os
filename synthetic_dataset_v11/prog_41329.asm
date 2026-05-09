; DESCRIPTION: Draws a black circle centered at (60, 145) with radius 58.
; PLAN: r0=60(x), r1=145(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 145
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
