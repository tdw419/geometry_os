; DESCRIPTION: Draws a green circle centered at (283, 111) with radius 19.
; PLAN: r0=283(x), r1=111(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 111
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
