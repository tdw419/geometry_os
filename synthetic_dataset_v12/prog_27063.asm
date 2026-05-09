; DESCRIPTION: Draws a red circle centered at (212, 125) with radius 77.
; PLAN: r0=212(x), r1=125(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 125
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
