; DESCRIPTION: Draws a green circle centered at (353, 179) with radius 22.
; PLAN: r0=353(x), r1=179(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 179
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
