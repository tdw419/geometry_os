; DESCRIPTION: Draws a black circle centered at (352, 75) with radius 21.
; PLAN: r0=352(x), r1=75(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 75
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
