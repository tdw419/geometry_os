; DESCRIPTION: Draws a red circle centered at (167, 102) with radius 52.
; PLAN: r0=167(x), r1=102(y), r2=52(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 102
LDI r2, 52
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
