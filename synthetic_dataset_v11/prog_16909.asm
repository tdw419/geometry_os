; DESCRIPTION: Draws a red circle centered at (58, 99) with radius 23.
; PLAN: r0=58(x), r1=99(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 99
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
