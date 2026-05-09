; DESCRIPTION: Draws a purple circle centered at (206, 157) with radius 46.
; PLAN: r0=206(x), r1=157(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 157
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
