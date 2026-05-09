; DESCRIPTION: Draws a red circle centered at (222, 167) with radius 13.
; PLAN: r0=222(x), r1=167(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 222
LDI r1, 167
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
