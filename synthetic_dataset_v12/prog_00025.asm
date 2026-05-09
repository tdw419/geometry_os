; DESCRIPTION: Draws a green circle centered at (265, 181) with radius 19.
; PLAN: r0=265(x), r1=181(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 181
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
