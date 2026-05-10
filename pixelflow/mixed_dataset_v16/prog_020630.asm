; DESCRIPTION: Draws a black circle centered at (370, 39) with radius 22.
; PLAN: r0=370(x), r1=39(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 39
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
