; DESCRIPTION: Draws a green circle centered at (431, 113) with radius 44.
; PLAN: r0=431(x), r1=113(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 113
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
