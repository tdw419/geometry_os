; DESCRIPTION: Draws a black circle centered at (123, 79) with radius 56.
; PLAN: r0=123(x), r1=79(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 79
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
