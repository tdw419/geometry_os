; DESCRIPTION: Draws a black circle centered at (90, 146) with radius 69.
; PLAN: r0=90(x), r1=146(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 146
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
