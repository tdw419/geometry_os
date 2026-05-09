; DESCRIPTION: Draws a purple circle centered at (401, 174) with radius 22.
; PLAN: r0=401(x), r1=174(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 174
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
