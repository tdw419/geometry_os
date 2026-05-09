; DESCRIPTION: Draws a green circle centered at (181, 27) with radius 25.
; PLAN: r0=181(x), r1=27(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 27
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
