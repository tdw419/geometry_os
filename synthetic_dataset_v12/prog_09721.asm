; DESCRIPTION: Draws a red circle centered at (390, 125) with radius 35.
; PLAN: r0=390(x), r1=125(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 125
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
