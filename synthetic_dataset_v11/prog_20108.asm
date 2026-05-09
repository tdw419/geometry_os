; DESCRIPTION: Draws a green circle centered at (151, 88) with radius 69.
; PLAN: r0=151(x), r1=88(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 151
LDI r1, 88
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
