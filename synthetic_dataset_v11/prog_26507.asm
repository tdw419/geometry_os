; DESCRIPTION: Draws a yellow circle centered at (94, 69) with radius 40.
; PLAN: r0=94(x), r1=69(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 69
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
