; DESCRIPTION: Draws a magenta circle centered at (165, 108) with radius 55.
; PLAN: r0=165(x), r1=108(y), r2=55(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 108
LDI r2, 55
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
