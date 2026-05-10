; DESCRIPTION: Draws a green circle centered at (195, 111) with radius 74.
; PLAN: r0=195(x), r1=111(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 111
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
