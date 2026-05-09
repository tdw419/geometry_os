; DESCRIPTION: Draws a green circle centered at (37, 124) with radius 19.
; PLAN: r0=37(x), r1=124(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 37
LDI r1, 124
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
