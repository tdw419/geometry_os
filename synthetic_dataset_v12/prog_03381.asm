; DESCRIPTION: Draws a yellow circle centered at (389, 171) with radius 15.
; PLAN: r0=389(x), r1=171(y), r2=15(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 171
LDI r2, 15
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
