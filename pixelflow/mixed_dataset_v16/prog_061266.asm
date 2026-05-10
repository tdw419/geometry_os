; DESCRIPTION: Draws a red circle centered at (369, 136) with radius 34.
; PLAN: r0=369(x), r1=136(y), r2=34(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 136
LDI r2, 34
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
