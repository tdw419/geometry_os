; DESCRIPTION: Draws a black circle centered at (66, 149) with radius 29.
; PLAN: r0=66(x), r1=149(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 149
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
