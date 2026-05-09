; DESCRIPTION: Draws a yellow circle centered at (202, 158) with radius 72.
; PLAN: r0=202(x), r1=158(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 158
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
