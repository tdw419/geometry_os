; DESCRIPTION: Draws a blue circle centered at (305, 136) with radius 68.
; PLAN: r0=305(x), r1=136(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 136
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
