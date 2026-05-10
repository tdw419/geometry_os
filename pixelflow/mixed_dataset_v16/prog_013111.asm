; DESCRIPTION: Draws a red circle centered at (182, 110) with radius 21.
; PLAN: r0=182(x), r1=110(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 110
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
