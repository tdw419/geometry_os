; DESCRIPTION: Draws a blue circle centered at (307, 173) with radius 43.
; PLAN: r0=307(x), r1=173(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 173
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
