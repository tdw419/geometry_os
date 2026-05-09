; DESCRIPTION: Draws a blue circle centered at (148, 68) with radius 16.
; PLAN: r0=148(x), r1=68(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 68
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
