; DESCRIPTION: Draws a green circle centered at (130, 176) with radius 72.
; PLAN: r0=130(x), r1=176(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 176
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
