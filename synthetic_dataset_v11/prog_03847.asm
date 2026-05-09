; DESCRIPTION: Draws a red circle centered at (72, 142) with radius 15.
; PLAN: r0=72(x), r1=142(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 142
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
