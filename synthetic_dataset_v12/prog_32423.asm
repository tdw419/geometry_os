; DESCRIPTION: Draws a red circle centered at (79, 168) with radius 61.
; PLAN: r0=79(x), r1=168(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 168
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
