; DESCRIPTION: Draws a black circle centered at (118, 135) with radius 78.
; PLAN: r0=118(x), r1=135(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 135
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
