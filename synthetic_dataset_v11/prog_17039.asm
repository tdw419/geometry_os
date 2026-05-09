; DESCRIPTION: Draws a green circle centered at (217, 218) with radius 23.
; PLAN: r0=217(x), r1=218(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 218
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
