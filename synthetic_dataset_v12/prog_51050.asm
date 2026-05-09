; DESCRIPTION: Draws a yellow circle centered at (53, 97) with radius 43.
; PLAN: r0=53(x), r1=97(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 97
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
