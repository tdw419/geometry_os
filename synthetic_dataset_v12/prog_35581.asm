; DESCRIPTION: Draws a green circle centered at (132, 144) with radius 64.
; PLAN: r0=132(x), r1=144(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 144
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
