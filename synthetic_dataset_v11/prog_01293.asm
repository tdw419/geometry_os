; DESCRIPTION: Draws a yellow circle centered at (61, 69) with radius 47.
; PLAN: r0=61(x), r1=69(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 69
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
