; DESCRIPTION: Draws a green circle centered at (94, 188) with radius 27.
; PLAN: r0=94(x), r1=188(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 188
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
