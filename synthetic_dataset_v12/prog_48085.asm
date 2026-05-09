; DESCRIPTION: Draws a green circle centered at (463, 154) with radius 18.
; PLAN: r0=463(x), r1=154(y), r2=18(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 154
LDI r2, 18
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
