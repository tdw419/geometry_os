; DESCRIPTION: Draws a yellow circle centered at (125, 79) with radius 39.
; PLAN: r0=125(x), r1=79(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 79
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
