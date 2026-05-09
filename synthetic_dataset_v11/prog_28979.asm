; DESCRIPTION: Draws a red circle centered at (179, 73) with radius 35.
; PLAN: r0=179(x), r1=73(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 73
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
