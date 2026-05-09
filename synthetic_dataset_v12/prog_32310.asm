; DESCRIPTION: Draws a yellow circle centered at (113, 156) with radius 44.
; PLAN: r0=113(x), r1=156(y), r2=44(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 156
LDI r2, 44
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
