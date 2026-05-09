; DESCRIPTION: Draws a green circle centered at (233, 65) with radius 57.
; PLAN: r0=233(x), r1=65(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 65
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
