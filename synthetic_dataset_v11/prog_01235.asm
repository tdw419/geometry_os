; DESCRIPTION: Draws a orange circle centered at (131, 114) with radius 58.
; PLAN: r0=131(x), r1=114(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 114
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
