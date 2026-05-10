; DESCRIPTION: Draws a yellow circle centered at (111, 212) with radius 40.
; PLAN: r0=111(x), r1=212(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 111
LDI r1, 212
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
