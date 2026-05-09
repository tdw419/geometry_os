; DESCRIPTION: Draws a black circle centered at (303, 123) with radius 79.
; PLAN: r0=303(x), r1=123(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 123
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
