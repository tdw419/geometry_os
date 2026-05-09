; DESCRIPTION: Draws a yellow circle centered at (209, 188) with radius 47.
; PLAN: r0=209(x), r1=188(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 188
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
