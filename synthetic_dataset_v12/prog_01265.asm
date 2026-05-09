; DESCRIPTION: Draws a red circle centered at (247, 24) with radius 20.
; PLAN: r0=247(x), r1=24(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 24
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
