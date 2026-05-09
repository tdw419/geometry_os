; DESCRIPTION: Draws a red circle centered at (118, 154) with radius 73.
; PLAN: r0=118(x), r1=154(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 154
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
