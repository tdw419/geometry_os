; DESCRIPTION: Draws a red circle centered at (61, 142) with radius 16.
; PLAN: r0=61(x), r1=142(y), r2=16(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 142
LDI r2, 16
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
