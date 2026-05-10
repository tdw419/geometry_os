; DESCRIPTION: Draws a purple circle centered at (268, 47) with radius 19.
; PLAN: r0=268(x), r1=47(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 47
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
