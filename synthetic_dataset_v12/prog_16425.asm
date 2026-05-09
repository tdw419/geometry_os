; DESCRIPTION: Draws a purple circle centered at (337, 138) with radius 39.
; PLAN: r0=337(x), r1=138(y), r2=39(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 138
LDI r2, 39
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
