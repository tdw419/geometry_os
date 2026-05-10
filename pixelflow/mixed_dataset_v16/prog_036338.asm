; DESCRIPTION: Draws a blue circle centered at (368, 57) with radius 35.
; PLAN: r0=368(x), r1=57(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 57
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
