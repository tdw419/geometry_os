; DESCRIPTION: Draws a green circle centered at (340, 166) with radius 40.
; PLAN: r0=340(x), r1=166(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 340
LDI r1, 166
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
