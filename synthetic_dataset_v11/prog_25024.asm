; DESCRIPTION: Draws a yellow circle centered at (185, 164) with radius 69.
; PLAN: r0=185(x), r1=164(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 164
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
