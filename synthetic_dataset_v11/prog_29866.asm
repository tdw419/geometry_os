; DESCRIPTION: Draws a red circle centered at (103, 78) with radius 61.
; PLAN: r0=103(x), r1=78(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 78
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
