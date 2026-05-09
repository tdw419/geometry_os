; DESCRIPTION: Draws a green circle centered at (367, 162) with radius 47.
; PLAN: r0=367(x), r1=162(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 367
LDI r1, 162
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
