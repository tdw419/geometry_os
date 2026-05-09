; DESCRIPTION: Draws a red circle centered at (210, 115) with radius 36.
; PLAN: r0=210(x), r1=115(y), r2=36(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 115
LDI r2, 36
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
