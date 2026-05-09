; DESCRIPTION: Draws a purple circle centered at (329, 124) with radius 72.
; PLAN: r0=329(x), r1=124(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 124
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
