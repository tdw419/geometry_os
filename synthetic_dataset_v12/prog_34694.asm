; DESCRIPTION: Draws a red circle centered at (360, 212) with radius 15.
; PLAN: r0=360(x), r1=212(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 212
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
