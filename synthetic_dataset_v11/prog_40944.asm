; DESCRIPTION: Draws a red circle centered at (61, 75) with radius 40.
; PLAN: r0=61(x), r1=75(y), r2=40(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 75
LDI r2, 40
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
