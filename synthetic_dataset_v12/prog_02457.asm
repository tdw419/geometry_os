; DESCRIPTION: Draws a red circle centered at (324, 176) with radius 56.
; PLAN: r0=324(x), r1=176(y), r2=56(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 176
LDI r2, 56
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
