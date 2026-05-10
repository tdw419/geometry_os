; DESCRIPTION: Draws a blue circle centered at (165, 174) with radius 51.
; PLAN: r0=165(x), r1=174(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 174
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
