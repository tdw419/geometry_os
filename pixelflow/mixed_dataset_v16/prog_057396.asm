; DESCRIPTION: Draws a yellow circle centered at (171, 77) with radius 69.
; PLAN: r0=171(x), r1=77(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 77
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
