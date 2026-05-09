; DESCRIPTION: Draws a blue circle centered at (415, 196) with radius 43.
; PLAN: r0=415(x), r1=196(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 415
LDI r1, 196
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
