; DESCRIPTION: Draws a purple circle centered at (216, 214) with radius 28.
; PLAN: r0=216(x), r1=214(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 214
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
