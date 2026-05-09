; DESCRIPTION: Draws a red circle centered at (100, 53) with radius 51.
; PLAN: r0=100(x), r1=53(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 53
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
