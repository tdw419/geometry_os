; DESCRIPTION: Draws a green circle centered at (120, 115) with radius 63.
; PLAN: r0=120(x), r1=115(y), r2=63(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 115
LDI r2, 63
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
