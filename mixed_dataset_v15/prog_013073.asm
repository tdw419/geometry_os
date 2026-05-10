; DESCRIPTION: Draws a green circle centered at (176, 13) with radius 48.
; PLAN: r0=176(x), r1=13(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 13
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
