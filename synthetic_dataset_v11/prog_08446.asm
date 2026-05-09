; DESCRIPTION: Draws a green circle centered at (70, 73) with radius 63.
; PLAN: r0=70(x), r1=73(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 73
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
