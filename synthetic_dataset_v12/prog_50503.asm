; DESCRIPTION: Draws a purple circle centered at (358, 151) with radius 39.
; PLAN: r0=358(x), r1=151(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 358
LDI r1, 151
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
