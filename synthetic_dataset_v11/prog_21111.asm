; DESCRIPTION: Draws a blue circle centered at (127, 177) with radius 58.
; PLAN: r0=127(x), r1=177(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 177
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
