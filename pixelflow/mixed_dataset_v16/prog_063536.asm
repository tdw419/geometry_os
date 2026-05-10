; DESCRIPTION: Draws a blue circle centered at (55, 194) with radius 21.
; PLAN: r0=55(x), r1=194(y), r2=21(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 194
LDI r2, 21
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
