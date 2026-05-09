; DESCRIPTION: Draws a green circle centered at (413, 198) with radius 44.
; PLAN: r0=413(x), r1=198(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 413
LDI r1, 198
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
