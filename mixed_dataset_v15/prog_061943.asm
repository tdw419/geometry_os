; DESCRIPTION: Draws a purple circle centered at (300, 159) with radius 57.
; PLAN: r0=300(x), r1=159(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 159
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
