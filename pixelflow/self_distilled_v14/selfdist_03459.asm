; DESCRIPTION: Draws a red circle centered at (229, 96) with radius 75.
; PLAN: r0=229(x), r1=96(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 96
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
