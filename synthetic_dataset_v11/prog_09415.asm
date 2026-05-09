; DESCRIPTION: Draws a green circle centered at (79, 150) with radius 66.
; PLAN: r0=79(x), r1=150(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 150
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
