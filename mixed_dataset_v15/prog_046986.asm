; DESCRIPTION: Draws a purple circle centered at (230, 167) with radius 72.
; PLAN: r0=230(x), r1=167(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 167
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
