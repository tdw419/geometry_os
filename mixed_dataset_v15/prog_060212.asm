; DESCRIPTION: Draws a red circle centered at (355, 144) with radius 78.
; PLAN: r0=355(x), r1=144(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 144
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
