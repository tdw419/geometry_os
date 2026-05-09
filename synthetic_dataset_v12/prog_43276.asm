; DESCRIPTION: Draws a green circle centered at (144, 122) with radius 28.
; PLAN: r0=144(x), r1=122(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 122
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
