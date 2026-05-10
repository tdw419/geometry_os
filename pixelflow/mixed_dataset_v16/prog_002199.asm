; DESCRIPTION: Draws a black circle centered at (150, 91) with radius 58.
; PLAN: r0=150(x), r1=91(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 91
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
