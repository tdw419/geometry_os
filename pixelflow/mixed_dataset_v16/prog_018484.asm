; DESCRIPTION: Draws a red circle centered at (212, 192) with radius 37.
; PLAN: r0=212(x), r1=192(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 192
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
