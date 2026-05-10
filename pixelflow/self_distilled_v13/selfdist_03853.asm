; DESCRIPTION: Draws a red circle centered at (161, 96) with radius 18.
; PLAN: r0=161(x), r1=96(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 96
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
