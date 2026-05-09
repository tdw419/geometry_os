; DESCRIPTION: Draws a purple circle centered at (74, 177) with radius 39.
; PLAN: r0=74(x), r1=177(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 177
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
