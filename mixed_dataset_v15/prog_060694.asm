; DESCRIPTION: Draws a green circle centered at (421, 146) with radius 62.
; PLAN: r0=421(x), r1=146(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 146
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
