; DESCRIPTION: Draws a black circle centered at (202, 63) with radius 53.
; PLAN: r0=202(x), r1=63(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 63
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
