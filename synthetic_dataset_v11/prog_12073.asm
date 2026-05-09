; DESCRIPTION: Draws a green circle centered at (118, 128) with radius 40.
; PLAN: r0=118(x), r1=128(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 128
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
