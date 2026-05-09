; DESCRIPTION: Draws a green circle centered at (324, 157) with radius 72.
; PLAN: r0=324(x), r1=157(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 157
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
