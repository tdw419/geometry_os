; DESCRIPTION: Draws a blue circle centered at (161, 103) with radius 61.
; PLAN: r0=161(x), r1=103(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 103
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
