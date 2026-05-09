; DESCRIPTION: Draws a green circle centered at (454, 23) with radius 16.
; PLAN: r0=454(x), r1=23(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 23
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
