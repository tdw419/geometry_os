; DESCRIPTION: Draws a green circle centered at (455, 160) with radius 36.
; PLAN: r0=455(x), r1=160(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 160
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
