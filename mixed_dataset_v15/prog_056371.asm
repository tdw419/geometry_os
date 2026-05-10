; DESCRIPTION: Draws a blue circle centered at (17, 57) with radius 19.
; PLAN: r0=17(x), r1=57(y), r2=19(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 17
LDI r1, 57
LDI r2, 19
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
