; DESCRIPTION: Draws a green circle centered at (421, 213) with radius 29.
; PLAN: r0=421(x), r1=213(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 213
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
