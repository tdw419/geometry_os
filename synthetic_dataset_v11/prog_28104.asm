; DESCRIPTION: Draws a green circle centered at (156, 57) with radius 29.
; PLAN: r0=156(x), r1=57(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 57
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
