; DESCRIPTION: Draws a green circle centered at (143, 166) with radius 72.
; PLAN: r0=143(x), r1=166(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 166
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
