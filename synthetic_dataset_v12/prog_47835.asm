; DESCRIPTION: Draws a purple circle centered at (411, 72) with radius 68.
; PLAN: r0=411(x), r1=72(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 72
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
