; DESCRIPTION: Draws a red circle centered at (339, 19) with radius 16.
; PLAN: r0=339(x), r1=19(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 19
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
