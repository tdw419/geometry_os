; DESCRIPTION: Draws a green circle centered at (50, 43) with radius 28.
; PLAN: r0=50(x), r1=43(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 50
LDI r1, 43
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
