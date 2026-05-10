; DESCRIPTION: Draws a yellow circle centered at (156, 85) with radius 62.
; PLAN: r0=156(x), r1=85(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 85
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
