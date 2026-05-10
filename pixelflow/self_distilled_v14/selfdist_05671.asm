; DESCRIPTION: Draws a red circle centered at (265, 113) with radius 70.
; PLAN: r0=265(x), r1=113(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 113
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
