; DESCRIPTION: Draws a yellow circle centered at (449, 102) with radius 57.
; PLAN: r0=449(x), r1=102(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 102
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
