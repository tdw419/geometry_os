; DESCRIPTION: Draws a green circle centered at (179, 127) with radius 22.
; PLAN: r0=179(x), r1=127(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 127
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
