; DESCRIPTION: Draws a red circle centered at (21, 92) with radius 13.
; PLAN: r0=21(x), r1=92(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 92
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
