; DESCRIPTION: Draws a green circle centered at (183, 171) with radius 36.
; PLAN: r0=183(x), r1=171(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 171
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
