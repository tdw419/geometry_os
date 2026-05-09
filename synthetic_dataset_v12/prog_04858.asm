; DESCRIPTION: Draws a red circle centered at (250, 77) with radius 62.
; PLAN: r0=250(x), r1=77(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 77
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
