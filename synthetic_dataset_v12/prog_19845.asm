; DESCRIPTION: Draws a black circle centered at (125, 59) with radius 58.
; PLAN: r0=125(x), r1=59(y), r2=58(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 59
LDI r2, 58
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
