; DESCRIPTION: Draws a green circle centered at (236, 60) with radius 46.
; PLAN: r0=236(x), r1=60(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 60
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
