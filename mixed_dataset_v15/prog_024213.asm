; DESCRIPTION: Draws a green circle centered at (452, 33) with radius 29.
; PLAN: r0=452(x), r1=33(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 33
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
