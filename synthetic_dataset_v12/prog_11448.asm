; DESCRIPTION: Draws a yellow circle centered at (285, 153) with radius 38.
; PLAN: r0=285(x), r1=153(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 153
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
