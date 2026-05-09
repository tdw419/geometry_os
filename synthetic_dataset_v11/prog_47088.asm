; DESCRIPTION: Draws a green circle centered at (120, 134) with radius 61.
; PLAN: r0=120(x), r1=134(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 134
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
