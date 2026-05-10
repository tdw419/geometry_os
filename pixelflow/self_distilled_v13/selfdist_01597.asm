; DESCRIPTION: Draws a red circle centered at (247, 192) with radius 56.
; PLAN: r0=247(x), r1=192(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 192
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
