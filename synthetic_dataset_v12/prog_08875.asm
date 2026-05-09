; DESCRIPTION: Draws a blue circle centered at (229, 58) with radius 23.
; PLAN: r0=229(x), r1=58(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 58
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
