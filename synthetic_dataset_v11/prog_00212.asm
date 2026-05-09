; DESCRIPTION: Draws a blue circle centered at (143, 165) with radius 56.
; PLAN: r0=143(x), r1=165(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 165
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
