; DESCRIPTION: Draws a yellow circle centered at (407, 171) with radius 56.
; PLAN: r0=407(x), r1=171(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 171
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
