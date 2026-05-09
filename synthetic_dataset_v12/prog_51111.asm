; DESCRIPTION: Draws a yellow circle centered at (79, 117) with radius 60.
; PLAN: r0=79(x), r1=117(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 117
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
