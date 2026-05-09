; DESCRIPTION: Draws a red circle centered at (142, 60) with radius 57.
; PLAN: r0=142(x), r1=60(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 142
LDI r1, 60
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
