; DESCRIPTION: Draws a black circle centered at (403, 90) with radius 15.
; PLAN: r0=403(x), r1=90(y), r2=15(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 90
LDI r2, 15
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
