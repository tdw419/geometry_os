; DESCRIPTION: Draws a green circle centered at (113, 178) with radius 29.
; PLAN: r0=113(x), r1=178(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 178
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
