; DESCRIPTION: Draws a blue circle centered at (217, 188) with radius 25.
; PLAN: r0=217(x), r1=188(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 188
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
