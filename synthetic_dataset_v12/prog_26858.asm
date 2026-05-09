; DESCRIPTION: Draws a black circle centered at (54, 219) with radius 14.
; PLAN: r0=54(x), r1=219(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 219
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
