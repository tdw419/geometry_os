; DESCRIPTION: Draws a green circle centered at (131, 88) with radius 79.
; PLAN: r0=131(x), r1=88(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 88
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
