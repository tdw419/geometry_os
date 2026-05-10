; DESCRIPTION: Draws a black circle centered at (346, 108) with radius 78.
; PLAN: r0=346(x), r1=108(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 108
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
