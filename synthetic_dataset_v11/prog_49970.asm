; DESCRIPTION: Draws a green circle centered at (75, 90) with radius 68.
; PLAN: r0=75(x), r1=90(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 75
LDI r1, 90
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
