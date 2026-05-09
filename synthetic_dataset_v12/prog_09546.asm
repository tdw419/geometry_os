; DESCRIPTION: Draws a red circle centered at (304, 136) with radius 20.
; PLAN: r0=304(x), r1=136(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 136
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
