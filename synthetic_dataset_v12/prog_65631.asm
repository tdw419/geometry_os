; DESCRIPTION: Draws a red circle centered at (153, 113) with radius 43.
; PLAN: r0=153(x), r1=113(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 113
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
