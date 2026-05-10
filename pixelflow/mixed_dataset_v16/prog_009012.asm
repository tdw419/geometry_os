; DESCRIPTION: Draws a green circle centered at (349, 139) with radius 56.
; PLAN: r0=349(x), r1=139(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 139
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
