; DESCRIPTION: Draws a red circle centered at (162, 78) with radius 72.
; PLAN: r0=162(x), r1=78(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 78
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
