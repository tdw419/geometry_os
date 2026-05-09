; DESCRIPTION: Draws a white circle centered at (84, 197) with radius 35.
; PLAN: r0=84(x), r1=197(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 197
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
