; DESCRIPTION: Draws a blue circle centered at (431, 107) with radius 66.
; PLAN: r0=431(x), r1=107(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 107
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
