; DESCRIPTION: Draws a green circle centered at (251, 79) with radius 58.
; PLAN: r0=251(x), r1=79(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 251
LDI r1, 79
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
