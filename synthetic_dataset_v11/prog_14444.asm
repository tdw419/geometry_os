; DESCRIPTION: Draws a black circle centered at (174, 121) with radius 79.
; PLAN: r0=174(x), r1=121(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 121
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
