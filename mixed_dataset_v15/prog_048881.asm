; DESCRIPTION: Draws a green circle centered at (384, 225) with radius 14.
; PLAN: r0=384(x), r1=225(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 225
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
