; DESCRIPTION: Draws a green circle centered at (469, 68) with radius 28.
; PLAN: r0=469(x), r1=68(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 68
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
