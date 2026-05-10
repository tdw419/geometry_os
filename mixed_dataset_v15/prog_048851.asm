; DESCRIPTION: Draws a green circle centered at (197, 69) with radius 22.
; PLAN: r0=197(x), r1=69(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 69
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
