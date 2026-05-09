; DESCRIPTION: Draws a yellow circle centered at (102, 127) with radius 28.
; PLAN: r0=102(x), r1=127(y), r2=28(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 127
LDI r2, 28
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
