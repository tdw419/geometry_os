; DESCRIPTION: Draws a purple circle centered at (276, 148) with radius 57.
; PLAN: r0=276(x), r1=148(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 148
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
