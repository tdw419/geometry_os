; DESCRIPTION: Draws a yellow circle centered at (209, 139) with radius 39.
; PLAN: r0=209(x), r1=139(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 139
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
