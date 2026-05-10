; DESCRIPTION: Draws a purple circle centered at (210, 113) with radius 78.
; PLAN: r0=210(x), r1=113(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 113
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
