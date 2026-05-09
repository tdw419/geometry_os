; DESCRIPTION: Draws a purple circle centered at (243, 173) with radius 73.
; PLAN: r0=243(x), r1=173(y), r2=73(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 173
LDI r2, 73
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
