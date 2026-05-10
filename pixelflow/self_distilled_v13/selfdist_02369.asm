; DESCRIPTION: Draws a purple circle centered at (57, 146) with radius 35.
; PLAN: r0=57(x), r1=146(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 146
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
