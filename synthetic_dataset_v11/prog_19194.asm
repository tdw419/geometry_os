; DESCRIPTION: Draws a red circle centered at (61, 70) with radius 53.
; PLAN: r0=61(x), r1=70(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 70
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
