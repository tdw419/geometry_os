; DESCRIPTION: Draws a green circle centered at (120, 145) with radius 78.
; PLAN: r0=120(x), r1=145(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 145
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
