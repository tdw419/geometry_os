; DESCRIPTION: Draws a blue circle centered at (254, 153) with radius 67.
; PLAN: r0=254(x), r1=153(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 153
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
