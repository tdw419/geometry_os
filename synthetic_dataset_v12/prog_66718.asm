; DESCRIPTION: Draws a yellow circle centered at (102, 87) with radius 64.
; PLAN: r0=102(x), r1=87(y), r2=64(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 87
LDI r2, 64
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
