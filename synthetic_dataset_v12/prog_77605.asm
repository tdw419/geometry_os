; DESCRIPTION: Draws a black circle centered at (105, 133) with radius 76.
; PLAN: r0=105(x), r1=133(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 133
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
