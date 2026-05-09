; DESCRIPTION: Draws a green circle centered at (430, 103) with radius 40.
; PLAN: r0=430(x), r1=103(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 103
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
