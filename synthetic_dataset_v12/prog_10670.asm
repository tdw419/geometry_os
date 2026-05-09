; DESCRIPTION: Draws a black circle centered at (126, 174) with radius 72.
; PLAN: r0=126(x), r1=174(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 174
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
