; DESCRIPTION: Draws a red circle centered at (77, 81) with radius 24.
; PLAN: r0=77(x), r1=81(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 81
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
