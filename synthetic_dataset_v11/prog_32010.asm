; DESCRIPTION: Draws a red circle centered at (79, 93) with radius 74.
; PLAN: r0=79(x), r1=93(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 93
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
