; DESCRIPTION: Draws a green circle centered at (66, 111) with radius 58.
; PLAN: r0=66(x), r1=111(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 111
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
