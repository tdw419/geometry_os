; DESCRIPTION: Draws a yellow circle centered at (332, 62) with radius 57.
; PLAN: r0=332(x), r1=62(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 62
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
