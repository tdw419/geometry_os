; DESCRIPTION: Draws a black circle centered at (236, 212) with radius 19.
; PLAN: r0=236(x), r1=212(y), r2=19(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 212
LDI r2, 19
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
