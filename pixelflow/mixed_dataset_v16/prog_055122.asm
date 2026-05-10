; DESCRIPTION: Draws a green circle centered at (290, 69) with radius 58.
; PLAN: r0=290(x), r1=69(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 69
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
