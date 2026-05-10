; DESCRIPTION: Draws a yellow circle centered at (156, 118) with radius 56.
; PLAN: r0=156(x), r1=118(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 118
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
