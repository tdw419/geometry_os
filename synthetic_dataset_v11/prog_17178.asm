; DESCRIPTION: Draws a blue circle centered at (135, 173) with radius 30.
; PLAN: r0=135(x), r1=173(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 173
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
