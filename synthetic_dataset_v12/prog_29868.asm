; DESCRIPTION: Draws a blue circle centered at (384, 99) with radius 25.
; PLAN: r0=384(x), r1=99(y), r2=25(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 99
LDI r2, 25
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
