; DESCRIPTION: Draws a green circle centered at (212, 172) with radius 48.
; PLAN: r0=212(x), r1=172(y), r2=48(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 172
LDI r2, 48
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
