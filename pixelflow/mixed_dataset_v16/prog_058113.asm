; DESCRIPTION: Draws a purple circle centered at (362, 159) with radius 64.
; PLAN: r0=362(x), r1=159(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 159
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
