; DESCRIPTION: Draws a black circle centered at (352, 217) with radius 24.
; PLAN: r0=352(x), r1=217(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 352
LDI r1, 217
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
