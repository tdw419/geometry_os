; DESCRIPTION: Draws a green circle centered at (81, 113) with radius 49.
; PLAN: r0=81(x), r1=113(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 113
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
