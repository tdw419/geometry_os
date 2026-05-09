; DESCRIPTION: Draws a green circle centered at (436, 57) with radius 51.
; PLAN: r0=436(x), r1=57(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 436
LDI r1, 57
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
