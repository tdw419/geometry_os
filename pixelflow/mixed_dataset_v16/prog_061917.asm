; DESCRIPTION: Draws a green circle centered at (349, 142) with radius 79.
; PLAN: r0=349(x), r1=142(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 142
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
