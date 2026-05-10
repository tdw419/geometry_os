; DESCRIPTION: Draws a green circle centered at (183, 193) with radius 10.
; PLAN: r0=183(x), r1=193(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 193
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
