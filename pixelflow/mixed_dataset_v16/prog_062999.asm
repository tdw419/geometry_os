; DESCRIPTION: Draws a red circle centered at (114, 191) with radius 15.
; PLAN: r0=114(x), r1=191(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 191
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
