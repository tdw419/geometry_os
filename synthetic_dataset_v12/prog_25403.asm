; DESCRIPTION: Draws a red circle centered at (369, 92) with radius 80.
; PLAN: r0=369(x), r1=92(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 92
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
