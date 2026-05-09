; DESCRIPTION: Draws a green circle centered at (57, 68) with radius 55.
; PLAN: r0=57(x), r1=68(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 68
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
