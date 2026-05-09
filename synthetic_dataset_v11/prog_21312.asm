; DESCRIPTION: Draws a green circle centered at (68, 94) with radius 64.
; PLAN: r0=68(x), r1=94(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 94
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
