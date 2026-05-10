; DESCRIPTION: Draws a red circle centered at (229, 95) with radius 35.
; PLAN: r0=229(x), r1=95(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 229
LDI r1, 95
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
