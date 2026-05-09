; DESCRIPTION: Draws a black circle centered at (138, 222) with radius 22.
; PLAN: r0=138(x), r1=222(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 222
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
