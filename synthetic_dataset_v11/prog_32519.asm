; DESCRIPTION: Draws a red circle centered at (135, 115) with radius 73.
; PLAN: r0=135(x), r1=115(y), r2=73(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 115
LDI r2, 73
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
