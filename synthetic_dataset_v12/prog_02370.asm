; DESCRIPTION: Draws a black circle centered at (223, 208) with radius 23.
; PLAN: r0=223(x), r1=208(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 208
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
