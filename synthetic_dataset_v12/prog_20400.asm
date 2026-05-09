; DESCRIPTION: Draws a white circle centered at (278, 195) with radius 23.
; PLAN: r0=278(x), r1=195(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 195
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
