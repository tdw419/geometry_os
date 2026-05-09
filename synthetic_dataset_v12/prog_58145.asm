; DESCRIPTION: Draws a blue circle centered at (285, 59) with radius 13.
; PLAN: r0=285(x), r1=59(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 59
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
