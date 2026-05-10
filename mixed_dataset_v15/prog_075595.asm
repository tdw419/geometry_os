; DESCRIPTION: Draws a yellow circle centered at (408, 154) with radius 58.
; PLAN: r0=408(x), r1=154(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 408
LDI r1, 154
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
