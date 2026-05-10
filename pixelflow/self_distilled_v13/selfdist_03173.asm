; DESCRIPTION: Draws a green circle centered at (303, 153) with radius 32.
; PLAN: r0=303(x), r1=153(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 153
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
