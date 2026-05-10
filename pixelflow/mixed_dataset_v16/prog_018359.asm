; DESCRIPTION: Draws a red circle centered at (188, 95) with radius 38.
; PLAN: r0=188(x), r1=95(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 95
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
