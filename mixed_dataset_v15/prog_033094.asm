; DESCRIPTION: Draws a blue circle centered at (407, 61) with radius 57.
; PLAN: r0=407(x), r1=61(y), r2=57(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 61
LDI r2, 57
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
