; DESCRIPTION: Draws a red circle centered at (360, 136) with radius 78.
; PLAN: r0=360(x), r1=136(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 136
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
