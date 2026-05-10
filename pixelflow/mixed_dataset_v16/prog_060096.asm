; DESCRIPTION: Draws a black circle centered at (95, 84) with radius 59.
; PLAN: r0=95(x), r1=84(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 84
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
