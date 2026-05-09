; DESCRIPTION: Draws a yellow circle centered at (117, 139) with radius 56.
; PLAN: r0=117(x), r1=139(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 139
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
