; DESCRIPTION: Draws a blue circle centered at (401, 141) with radius 62.
; PLAN: r0=401(x), r1=141(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 401
LDI r1, 141
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
