; DESCRIPTION: Draws a red circle centered at (161, 53) with radius 38.
; PLAN: r0=161(x), r1=53(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 53
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
