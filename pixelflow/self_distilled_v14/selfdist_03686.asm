; DESCRIPTION: Draws a yellow circle centered at (49, 111) with radius 13.
; PLAN: r0=49(x), r1=111(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 111
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
