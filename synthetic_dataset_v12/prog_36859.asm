; DESCRIPTION: Draws a blue circle centered at (167, 162) with radius 25.
; PLAN: r0=167(x), r1=162(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 162
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
