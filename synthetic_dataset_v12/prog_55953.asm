; DESCRIPTION: Draws a blue circle centered at (476, 149) with radius 27.
; PLAN: r0=476(x), r1=149(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 149
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
