; DESCRIPTION: Draws a red circle centered at (93, 64) with radius 30.
; PLAN: r0=93(x), r1=64(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 64
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
