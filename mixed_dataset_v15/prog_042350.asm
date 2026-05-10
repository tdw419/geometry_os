; DESCRIPTION: Draws a green circle centered at (384, 122) with radius 74.
; PLAN: r0=384(x), r1=122(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 122
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
