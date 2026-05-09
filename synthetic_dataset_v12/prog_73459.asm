; DESCRIPTION: Draws a green circle centered at (69, 78) with radius 62.
; PLAN: r0=69(x), r1=78(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 78
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
