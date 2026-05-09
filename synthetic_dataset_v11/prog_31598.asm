; DESCRIPTION: Draws a yellow circle centered at (109, 150) with radius 58.
; PLAN: r0=109(x), r1=150(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 150
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
