; DESCRIPTION: Draws a green circle centered at (412, 73) with radius 31.
; PLAN: r0=412(x), r1=73(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 73
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
