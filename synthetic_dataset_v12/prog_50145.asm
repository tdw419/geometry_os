; DESCRIPTION: Draws a red circle centered at (361, 121) with radius 80.
; PLAN: r0=361(x), r1=121(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 121
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
