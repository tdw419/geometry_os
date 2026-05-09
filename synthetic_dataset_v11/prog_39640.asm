; DESCRIPTION: Draws a yellow circle centered at (93, 91) with radius 47.
; PLAN: r0=93(x), r1=91(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 91
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
